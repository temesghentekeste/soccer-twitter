require 'rails_helper'

describe 'creating a new user' do
  it 'visits user registration path' do
    visit root_url
    find('#sign-up-btn-1').click
    expect(current_path).to eq(new_user_registration_path)
  end
  it 'does not save user with valid params if images are not attached' do
    visit root_url
    find('#sign-up-btn-1').click

    fill_in 'user_full_name', with: 'John Doe'
    fill_in 'user_username', with: 'johndoe'
    fill_in 'user_email', with: 'johndoe@test.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_text('2 errors prohibited this user from being saved')
  end

  it 'save user with valid params and attached files' do
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

    expect(current_path).to eq(home_path)
  end
end
