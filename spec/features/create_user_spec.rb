require 'rails_helper'

describe 'creating a new user' do
  it 'does not save user with valid params if images are not attached' do
    visit root_url
    find('#sign-up-btn-1').click

    expect(current_path).to eq(new_user_registration_path)
    fill_in 'user_full_name', with: 'John Doe'
    fill_in 'user_username', with: 'johndoe'
    fill_in 'user_email', with: 'johndoe@test.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(current_path).to eq(users_path)

    expect(page).to have_text('Welcome to Soccer Twitter')
    expect(page).to have_text('2 errors prohibited this user from being saved')
    expect(page).to have_text('Sign up')
  end

  it 'save user with valid params and attached files' do
    visit root_url
    find('#sign-up-btn-1').click

    expect(current_path).to eq(new_user_registration_path)
    fill_in 'user_full_name', with: 'John Doe'
    fill_in 'user_username', with: 'johndoe'
    fill_in 'user_email', with: 'johndoe@test.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    attach_file('user_photo', File.absolute_path('./spec/support/assets/test-photo.jpeg'))
    attach_file('user_cover_image', File.absolute_path('./spec/support/assets/test-cover-image.jpg'))
    
    click_button 'Sign up'

    expect(current_path).to eq(home_path)
    expect(page).to have_text("Following")
    expect(page).to have_text("0")
    expect(page).to have_text("Followers")
    expect(page).to have_text("John Doe")
    
  end
end
