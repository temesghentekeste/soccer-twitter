require 'rails_helper'

RSpec.describe FollowingsController, type: :controller do
  describe 'POST #create' do
    it 'creates a new following record' do
      @follower = FactoryBot.create(:user)
      @followed = FactoryBot.create(:user)

      sign_in @follower

      expect do
        post :create, params: {
         following: {
             follower_id: @follower.id,
             followed_id: @followed.id
           }
         }
     end .to change { Following.count }.from(0).to(1)
      expect(response).to redirect_to(profile_path @followed.username)
      expect(response).to have_http_status(302)
    end
  end

  describe 'DELETE #destroy' do
    it 'removes a following entry from database' do
      @follower = FactoryBot.create(:user)
      sign_in @follower

      @following = FactoryBot.create(:following)
      expect { delete :destroy, params: { id: @following.id } }.to change { Following.count }.from(1).to(0)
      @followed = User.find(@following.followed_id)
      expect(response).to redirect_to(profile_path @followed.username)
      expect(response).to have_http_status(302)
    end
  end
 
end
