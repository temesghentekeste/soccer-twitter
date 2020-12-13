require 'rails_helper'

RSpec.describe Vote, type: :model do
  subject { Vote.new }
  
  describe 'friendship callbacks' do
    describe 'associations' do
      it { should belong_to(:user).class_name('User') }
      it { should belong_to(:opinion).class_name('Opinion') }
    end
  end
end
