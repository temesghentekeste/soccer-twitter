require 'rails_helper'
RSpec.describe PagesHelper, type: :helper do
  before do
    @user = FactoryBot.create(:user)
    sign_in(@user)
  end

  describe '#user_avatar' do
    it 'renders the shared/profile_info partial' do
      actual_view = user_avatar(@user.id)
      img = '<img'
      expect(actual_view.include?(img)).to be(true)
    end
  end

  describe '#user_banner' do
    it 'renders the shared/profile_cover_image partial' do
      actual_view = user_banner(@user.id)
      img = '<img'
      expect(actual_view.include?(img)).to be(true)
    end
  end

  describe '#followers' do
    it 'renders the shared/no_followers partial' do
      actual_view = followers(@user)
      txt = 'No Followers'
      expect(actual_view.include?(txt)).to be(true)
    end
  end
end
