require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }


  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
  end

  describe 'First Name Format' do
    it { should allow_value("Julián D'Feregotti").for(:first_name) }
    it { should allow_value('Gaston Núñez').for(:first_name) }
    it { should_not allow_value('Pepe1234').for(:first_name) }
    it { should_not allow_value('R@ul Perez').for(:first_name) }
  end

  describe 'Last Name Format' do
    it { should allow_value('Perez Gonzales').for(:last_name) }
    it { should allow_value('Perez Gonzales').for(:last_name) }
    it { should_not allow_value('Acuña Fulanito12').for(:last_name) }
    it { should_not allow_value('Gomez!').for(:last_name) }
  end

  describe 'Email Format' do
    it { should allow_value('test@gmail.com').for(:email) }
  end
end
