class ApplicationController < ActionController::Base
  def test_error_tracking
    raise Exception.new("This is a test error")
  end
end
