require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #index' do
    it 'recognizes to render root path' do
      @user = FactoryBot.create(:user)
      sign_in(@user)

      assert_recognizes({:controller => "pages", :action => "index"},
        {:method => "get", :path => "/"})
    end

  end

  describe 'GET #discover' do
    it 'recognizes to render root path' do
      @user = FactoryBot.create(:user)
      sign_in(@user)

      assert_recognizes({:controller => "pages", :action => "discover"},
        {:method => "get", :path => "/discover"})
    end
  end

  describe 'GET #connect' do
    it 'recognizes to render root path' do
      @user = FactoryBot.create(:user)
      sign_in(@user)

      assert_recognizes({:controller => "pages", :action => "connect"},
        {:method => "get", :path => "/connect"})
    end
  end
end
