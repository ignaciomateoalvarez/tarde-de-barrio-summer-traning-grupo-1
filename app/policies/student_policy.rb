class StudentPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def update?
    student_created_by_me?
  end

  def edit?
    update?
  end

  private
  def student_created_by_me?
    @user.administrador? || (@user.colaborador? && @user == @record.user)
  end
end
