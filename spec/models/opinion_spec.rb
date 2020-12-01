require 'rails_helper'

RSpec.describe Opinion, type: :model do
  subject { Opinion.new }

  describe 'validations' do
    it { should validate_presence_of :author_id }
    it { should validate_presence_of :text }

    it { is_expected.to validate_length_of(:text).is_at_most(140) }

  end
  
  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
  end
end
