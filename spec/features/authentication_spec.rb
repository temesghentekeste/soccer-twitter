require 'rails_helper'

feature 'user authentication', type: :feature do

  feature 'signing in an existing user' do
    scenario 'failing test with invalid params' do
      create_user
      click_on 'LOG OUT'
      visit new_user_session_path
      fill_in 'user_email', with: 'fakemail@fake.com'
      click_on 'Log in'

      expect(page).to have_content('Invalid Email or password.')
    end

      scenario 'successful test with valid params' do
        create_user
        click_on 'LOG OUT'
        click_on 'Sign in'
        fill_in 'user_email', with: 'johndoe@someemail.com'
        fill_in 'user_password', with: 'password'
        click_on 'Log in'

        expect(page).to have_content('Signed in successfully.')
      end
    end

  def create_user
    visit new_user_registration_path
    fill_in 'user_full_name', with: 'John Doe'
    fill_in 'user_username', with: 'johndoe'
    fill_in 'user_email', with: 'johndoe@someemail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    attach_file('user_photo', File.absolute_path('./spec/support/assets/test-photo.jpeg'))
    attach_file('user_cover_image', File.absolute_path('./spec/support/assets/test-cover-image.jpg'))
    
    click_button 'Sign up'
  end
end
