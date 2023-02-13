require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:student) { build(:student) }

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:lastname) }
    it { should validate_presence_of(:go_to_school) }
    it { should validate_presence_of(:school_level) }
  end

  describe 'first_name_format' do
    it { should allow_value("Julián D'Feregotti").for(:name) }
    it { should allow_value('Gaston Núñez').for(:name) }
    it { should_not allow_value('Pepe1234').for(:name) }
    it { should_not allow_value('R@ul Perez').for(:name) }
  end

  describe 'last_name_format' do
    it { should allow_value('Perez Gonzales').for(:lastname) }
    it { should allow_value('Perez Gonzales').for(:lastname) }
    it { should_not allow_value('Acuña Fulanito12').for(:lastname) }
    it { should_not allow_value('Gomez!').for(:lastname) }
  end

  describe 'Enum TypeA' do
    it { should define_enum_for(:go_to_school).with_values(%i[yes no]) }
  end

  describe 'Enum Type' do
    it { should define_enum_for(:school_level).with_values(%i[kinder-garder primary secondary]) }
  end
end