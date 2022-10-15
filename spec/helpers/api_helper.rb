module ApiHelper
  protected

  def login(email, password)
    post user_session_path params: {
        email: email,
        password: password
    }
    @auth_headers = response.headers.slice("uid", "client", "access-token")
  end

  def login_user(user, password = 'password')
    login(user.email, password)
  end

  def logout
    auth_call :delete, destroy_user_session_path
  end

  def auth_call method, path, options = {}
    self.send method, path, {headers: @auth_headers.merge((options)[:headers] || {}), as: :json}.merge(options)
  end

  def json_response_body(&block)
    JSON.parse(response.body, symbolize_names: true).tap do |content|
      yield content if block_given?
    end
  end
end