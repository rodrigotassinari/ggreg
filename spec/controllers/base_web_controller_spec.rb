require 'rails_helper'

class FakeTestWebController < BaseWebController; end

describe BaseWebController do
  controller FakeTestWebController do
    def index
      render text: '42'
    end
  end

  # http://stackoverflow.com/a/14913135
  before do
    routes.draw do
      match 'index' => 'fake_test_web#index', via: [:get, :post, :put, :patch, :options]
    end
  end

  describe '#index' do
    context 'when initial setup was done' do
      before(:each) { expect(User).to receive(:any?).and_return(true) }
      it 'renders normally' do
        get :index
        expect(response).to be_success
        expect(response.body).to eql('42')
      end
    end
    context 'when initial setup has not been done' do
      before(:each) { expect(User).to receive(:any?).and_return(false) }
      it 'redirects to the setup page' do
        get :index
        expect(response).to redirect_to(web_signup_path)
      end
    end
  end

end
