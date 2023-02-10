class UserPolicy
  attr_reader :user,:record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.administrador?
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    user.administrador?
  end

  def update?
    user.administrador?
  end

  def toggle_deactivate?
    user.administrador?
  end

  def edit?
    update?
  end

  def destroy?
    false
  end
end
