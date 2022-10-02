class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: -> { request.format.json? }
  def test_error_tracking
    raise Exception.new("This is a test error")
  end
end
