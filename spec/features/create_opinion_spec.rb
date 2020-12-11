require 'rails_helper'

describe 'Creating a new opinion' do
  before do
    visit root_url
    find('#sign-up-btn-1').click

    fill_in 'user_full_name', with: 'John Doe'
    fill_in 'user_username', with: 'johndoe'
    fill_in 'user_email', with: 'johndoe@test.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    attach_file('user_photo', File.absolute_path('./spec/support/assets/test-photo.jpeg'))
    attach_file('user_cover_image', File.absolute_path('./spec/support/assets/test-cover-image.jpg'))
    
    click_button 'Sign up'
  end
  
  it 'creates a new opinion only if a user is signed in' do
    visit root_url
    
    fill_in 'opinion_text', with: 'Arsenal portrays lackluster performance'
    click_button 'Add Tweet'


    expect(page).to have_text('Arsenal portrays lackluster performance less than a minute')
  end

  describe 'creating an Opinion when user not signed in' do
    context 'creating a new opinion requires a user to sign in or sign up' do
      before do 
        click_link('LOG OUT')
      end

      it { expect(page).to have_link('Sign up') }
      it { expect(page).to have_link('Sign in') }
    end
  end
end
