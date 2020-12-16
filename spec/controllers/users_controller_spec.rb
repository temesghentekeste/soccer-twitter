require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    context 'renders users listing view' do
      before do
        @user = FactoryBot.create(:user)
        sign_in(@user)
        get :index
      end

      it { expect(response).to render_template('index') }
      it { expect(response).to have_http_status(200) }
    end

    context 'renders nil if user is not signed in' do
      before do 
        @user = FactoryBot.create(:user)
        get :index
      end

      it { expect(response).to render_template(nil) }
      it { expect(response).to have_http_status(302) }
    end

  end

  describe 'GET #show' do
    context 'renders the user show page' do
      before do
        @user = FactoryBot.create(:user)
        sign_in(@user)
        get :show, params: { id: @user.id }
      end

      it { expect(response).to redirect_to(profile_path(@user.username)) }
      it { expect(response).to have_http_status(302) }
    end
  end
end
