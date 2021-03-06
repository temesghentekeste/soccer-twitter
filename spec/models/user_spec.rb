require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new }

  describe 'validations' do
    it 'should validate presence of username' do
      subject.username = Faker::Name.name
      expect(subject.valid?).to be false
    end
    it { should validate_presence_of :full_name }
    it { should validate_presence_of :username }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :photo }
    it { should validate_presence_of :cover_image }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_uniqueness_of(:username).case_insensitive }
    
    it { is_expected.to validate_length_of(:full_name).is_at_most(50) }
    it { is_expected.to validate_length_of(:username).is_at_most(50) }
    it { is_expected.to validate_length_of(:email).is_at_most(105) }
  end
  
  describe 'associations' do
    it { should have_many(:opinions) }
    it { should have_many(:votes) }
    it { should have_many(:active_followings).class_name('Following').with_foreign_key('follower_id') }
    it { should have_many(:passive_followings).class_name('Following').with_foreign_key('followed_id') }
  end
  
  describe 'file attachements and user validty' do

    it 'invalid user with files not attached' do
      @user = User.new
      password = 'password'
      @user.full_name = Faker::Name.name[1..20] 
      @user.username = Faker::Name.name[1..20] 
      @user.email = Faker::Internet.email 
      @user.password = password 
      @user.password_confirmation = password 
      expect(@user.valid?).to be false
    end

    it 'valid user with files attached' do
      @user = FactoryBot.create(:user)
      expect(@user.valid?).to be true
    end

    it 'attaches the uploaded photo' do
      @user = FactoryBot.create(:user)
      expect(@user.photo).to be_attached
    end

    it 'attaches the uploaded cover image' do
      @user = FactoryBot.create(:user)
      expect(@user.cover_image).to be_attached
    end
  end
end
