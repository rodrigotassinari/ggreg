require 'rails_helper'

RSpec.describe Web::SessionsController, type: :controller do

  let!(:user) { create(:user) }

  describe '#new' do
    it 'returns http success' do
      get :new
      expect(response).to be_success
    end
  end

end
