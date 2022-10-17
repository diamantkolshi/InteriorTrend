module ApiHelper
  protected
  
  def auth_headers_for(user)
    user_headers = user.create_new_auth_token
    @request.headers.merge!(user_headers)
  end

  def json_response_body(&block)
    JSON.parse(response.body, symbolize_names: true).tap do |content|
      yield content if block_given?
    end
  end
end