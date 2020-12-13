require 'rails_helper'

feature 'stats feature', type: :feature do
  before do
    create_user('janedoe', 'janedoe@email.com')
    @follower = User.second
    
  end
  
  it 'a user can vist his/her own stats view' do
    expect(current_path).to eq(home_path)
    visit stats_path(@follower.username)
    expect(current_path).to eq(stats_path(@follower.username))
    expect(page).to have_content('STATISTICS')
    expect(page).to have_content('PROFILE VIEWS')
    expect(page).to have_content('VOTES PROGRESS')
    expect(page).to have_content('FOLLOWINGS PROGRESS')
  end

  scenario 'a user has profile view value' do
    expect(current_path).to eq(home_path)
    click_on 'LOG OUT'
    create_user('fake_name', 'fake_email@email.com')


    expect(current_path).to eq(home_path)
    visit profile_path(@follower.username)
    click_on 'LOG OUT'
    
    click_on 'Sign in'
    fill_in 'user_email', with: @follower.email
    fill_in 'user_password', with: 'password'
    click_on 'Log in'
    expect(current_path).to eq(home_path)
    visit stats_path(@follower.username)
    expect(current_path).to eq(stats_path(@follower.username))
    expect(page).to have_content('PROFILE VIEWS')
    expect(page).to have_content('Loading...')
    count = Impression.all.count
    expect(count).to eql(1)

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
