require 'rails_helper'

RSpec.describe OpinionsController, type: :controller do
  describe 'GET #index' do
    it 'renders profile view for signed in user' do
      @user = FactoryBot.create(:user)
      sign_in(@user)

      get :index

      expect(response).to redirect_to(profile_path(@user.username))
      expect(response).to have_http_status(302)
    end

    it 'renders nil if user is not signed in' do
      @user = FactoryBot.create(:user)
      
      get :index
      
      expect(response).to redirect_to(new_user_session_path)
      expect(response).to have_http_status(302)
    end
    
  end
  
  describe 'POST #create' do
    it 'reiderects user to sign in page if not logged in' do
      @user = FactoryBot.create(:user)
      
      get 'index'
      expect do
        @opinion = @user.opinions.build
        @opinion.text = 'some text'
        post :create, opinion: @opinion, params: { user_id: @user.id }
      end
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'increases opionion count if user signed in & opionion has valid params' do
      @user = FactoryBot.create(:user)
      sign_in(@user)
      expect do
         post :create, params: {
          opinion: {
              author_id: @user.id,
              text: Faker::Lorem.sentence(word_count: 2),
            }
          }
      end .to change { Opinion.count }.from(0).to(1)
    
      expect(response).to redirect_to(home_path)
      expect(response).to have_http_status(302)
    end
    it 'opionion count not changed if signed in user with invalid opionion params' do
      @user = FactoryBot.create(:user)
      sign_in(@user)
      expect do
         post :create, params: {
          opinion: {
              author_id: @user.id
            }
          }
      end.to_not change { Opinion.count }
    end
  end
  
 
  
end
