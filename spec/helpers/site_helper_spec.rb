require 'rails_helper'
RSpec.describe SiteHelper, type: :helper do
  before do
    @user = FactoryBot.create(:user)
    sign_in(@user)
  end
  describe '#flash_message' do
    it 'renders the layouts/notice partial' do
      param = 'notice'
      actual_view = flash_message(param)
      expected_view = "<div class=\"alert alert-success-custom alert-success-custom_profile\">\n"
      expect(expected_view).to eq(actual_view)
    end

    it 'renders the layouts/alert partial' do
      param = 'alert'
      actual_view = flash_message(param)
      expected_view = "<div class=\"alert alert-danger alert-success-custom_profile\">\n"
      expect(expected_view).to eq(actual_view)
    end
  end

  describe '#render_flash_message' do
    it 'renders the layouts/flash_messages partial' do
      name = 'alert'
      msg = 'Soccer tweet should not be empty'
      actual_view = render_flash_message(name, msg)
      expected_view = "<div class=\"flash-message\" id=\"flash_alert\">\n  Soccer tweet should not be empty\n</div>"
      expect(expected_view).to eq(actual_view)
    end
  end

  describe '#blank_tweet' do
    it "returns error message if tweet text is blank" do
      msg = ["Text can't be blank"]
      err = "Your soccer tweet can't be blank"
      expect(helper.blank_tweet('alert', msg)).to eq(err)
    end
  end
end
