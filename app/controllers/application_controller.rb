class ApplicationController < ActionController::Base
  around_action :catch_errors

  private

  def catch_errors(&)
    Rails.error.record(&)
  end
end
