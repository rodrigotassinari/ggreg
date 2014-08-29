require 'rails_helper'

describe Web::SignupsController, type: :controller do

  describe '#new' do
    context 'when no user exists' do
      it 'renders the template as http success' do
        get :new
        expect(response).to be_success
        expect(response).to render_template('new')
      end
      it 'assigns a new user to the view' do
        expect(User).to receive(:new).and_return(user = instance_double('User'))
        get :new
        expect(assigns(:user)).to eql(user)
      end
    end
    context 'when there is already an user' do
      it 'redirects to the root page with an error' do
        expect(User).to receive(:any?).and_return(true)
        get :new
        expect(flash[:error]).to_not be_empty
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe '#create' do
    context 'when no user exists' do
      context 'with valid params' do
        let(:params) { {user: {email: 'foo@bar.com', password: '123456', password_confirmation: '123456'}} }
        it 'creates a new user' do
          expect(User).to receive(:new).with(params[:user]).and_return(user = instance_double('User'))
          expect(user).to receive(:save).and_return(true)
          post :create, params
        end
        it 'redirects to the root path with a success message' do
          post :create, params
          expect(flash[:success]).to_not be_empty
          expect(response).to redirect_to(root_path)
        end
      end
      context 'with invalid params' do
        let(:params) { {user: {email: 'foo@bar.com', password: '123456', password_confirmation: '654321'}} }
        it 'does not create any user' do
          expect(User).to receive(:new).with(params[:user]).and_return(user = instance_double('User'))
          expect(user).to receive(:save).and_return(false)
          post :create, params
        end
        it 'renders the template with the user assigned with errors' do
          post :create, params
          expect(flash[:success]).to be_nil
          expect(response).to render_template('new')
          user = assigns(:user)
          expect(user).to be_new_record
          expect(user.errors).to_not be_empty
        end
      end
    end
    context 'when there is already an user' do
      let!(:user) { create(:user) }
      it 'redirects to the root page with an error' do
        expect(User).to receive(:any?).and_return(true)
        post :create
        expect(response).to redirect_to(root_path)
        expect(flash[:error]).to_not be_empty
      end
    end
  end

end
