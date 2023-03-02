require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { build(:user) }
  let(:student) { build(:student) }
  let(:comment) { build(:comment) }

  describe 'Validations' do
    it { should validate_presence_of(:body) }
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:student) }
    it { should respond_to(:student_id) }
    it { should have_many(:answers) }
  end
end
