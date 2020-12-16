require 'rails_helper'
RSpec.describe VoteHelper, type: :helper do
  before do
    @user = FactoryBot.create(:user)
    sign_in(@user)
  end
  
  describe '#score_status' do
    it 'returns success class for 0 score value' do
      actual_view = score_status(0)
      expect(actual_view.include?('primary-vote')).to be(false)
    end

    it 'returns primary-vote class for positive score value' do
      actual_view = score_status(10)
      expect(actual_view.include?('success')).to be(false)
    end

    it 'returns danger class for negative score value' do
      actual_view = score_status(-20)
      expect(actual_view.include?('danger')).to be(true)
    end
  end
end
