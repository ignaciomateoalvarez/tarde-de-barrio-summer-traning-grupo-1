require 'rails_helper'

RSpec.describe 'StudentsController', type: %i[request controller] do
  before(:each) do
    @user = build(:user)
    login_user
  end

  describe 'GET index' do
    before { get students_path }
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'POST create' do
    let!(:student) { create(:student) }
    before { post students_path student: student.attributes }
    it 'renders create template' do
      expect(response).to redirect_to(students_path)
    end
  end
  describe 'POST destroy' do
    let!(:student) { destroy(:student) }
    before { post students_path student: student.attributes }
    it 'renders destroy student' do
      expect(response).to redirect_to(students_path)
    end
  end
end
