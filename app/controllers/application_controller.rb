class ApplicationController < ActionController::Base
  around_action :catch_errors

  def logged_in
    redirect_to root_path unless user_signed_in?
  end

  private

  def catch_errors(&)
    Rails.error.record(&)
  end
end
