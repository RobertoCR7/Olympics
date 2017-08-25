class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :couldnt_find_record
  before_action :authenticate_user!
  
  private
  def couldnt_find_record
      redirect_to root_url, notice: "That record does not exist!"
  end
end
