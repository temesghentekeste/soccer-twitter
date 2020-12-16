require 'rails_helper'
RSpec.describe ApplicationHelper, type: :helper do
  before do
    @user = FactoryBot.create(:user)
    sign_in(@user)
  end
  
  describe '#border_right?' do
    it 'returns border-right class controllers apart stats_controller' do
      actual_view = border_right?
      expect(actual_view.include?('border-right')).to be(true)
    end
  end
  
  describe '#cloudinary_name?' do
    it 'returns cloudinary_name' do
      actual = cloudinary_name
      expected = ENV['CLOUD_NAME']
      expect(actual).to eql(expected)
    end
  end
  
  describe '#active_class?' do
    attr_reader :request
    it 'returns active-link class for a given path' do
      request.path = home_path
      actual = active_class?(request.path)
      expected = 'active-link'
      expect(actual).to eql(expected)
    end
  end

  describe '#font_weight?' do
    attr_reader :request
    it 'returns font-weight-bold class for a given path' do
      request.path = home_path
      actual = font_weight?(request.path)
      expected = 'font-weight-bold'
      expect(actual).to eql(expected)
    end
  end
end
