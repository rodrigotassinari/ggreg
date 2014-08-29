require 'rails_helper'

class FakeTestApiController < BaseApiController; end

describe BaseApiController do
  controller FakeTestApiController do
    def index
      render json: {answer: 42}, status: 200
    end
  end

  # http://stackoverflow.com/a/14913135
  before do
    routes.draw do
      match 'index' => 'fake_test_api#index', via: [:get, :post, :put, :patch, :options]
    end
  end

  describe '#index' do
    context 'when initial setup was done' do
      before(:each) { expect(User).to receive(:any?).and_return(true) }
      it 'returns a 200 response' do
        get :index
        expect(response.status).to eql(200)
        expect(response.body).to eql('{"answer":42}')
      end
    end
    context 'when initial setup has not been done' do
      before(:each) { expect(User).to receive(:any?).and_return(false) }
      it 'returns a 418 response' do
        get :index
        expect(response.status).to eql(418)
        expect(response.body).to eql('{"errors":{"message":"Initial setup not done yet."}}')
      end
    end
  end

end
