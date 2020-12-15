require 'rails_helper'

feature 'following feature', type: :feature do
  before do
    create_user('janedoe', 'janedoe@email.com')
    @follower = User.first
    @followed = User.last
    
  end
  
  it 'a user can follow another user' do
    expect(current_path).to eq(home_path)
    visit profile_path(@followed.username)
    expect(current_path).to eq(profile_path(@followed.username))
    expect(page).to have_content('Follow')
    find('.btn-custom').click

    expect(page).to have_content('Following')
  end

  scenario 'a user can unfollow another user he/she follows' do
    expect(current_path).to eq(home_path)
    visit profile_path(@followed.username)
    expect(current_path).to eq(profile_path(@followed.username))
    expect(page).to have_content('Follow')
    find('.btn-custom').click

    expect(page).to have_content('Following')
    find('.btn-custom_following').click
    expect(page).to have_content('Follow')

  end

  def create_user(username, email)
    visit new_user_registration_path
    fill_in 'user_full_name', with: 'John Doe'
    fill_in 'user_username', with: username
    fill_in 'user_email', with: email
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    attach_file('user_photo', File.absolute_path('./spec/support/assets/test-photo.jpeg'))
    attach_file('user_cover_image', File.absolute_path('./spec/support/assets/test-cover-image.jpg'))
    
    click_button 'Sign up'
  end
end
