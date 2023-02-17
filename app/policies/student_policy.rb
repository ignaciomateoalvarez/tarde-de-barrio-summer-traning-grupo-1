class StudentPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def update?
    @user.administrador? || (@user == @record.user)
  end

  def edit?
    update?
  end
end
