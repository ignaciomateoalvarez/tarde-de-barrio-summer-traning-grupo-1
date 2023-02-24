# frozen_string_literal: true

module AuthForRequest
  def login_user(user = nil)
    user ||= create(:user, role: 'administrador', active: true)
    username = user.email
    user.update password: '123', password_confirmation: '123'
    send(:post, '/login', params: { email: username, password: '123' })
  end

  def logout_user
    SessionsController.send(:destroy)
  end
end
