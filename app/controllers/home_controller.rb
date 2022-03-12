class HomeController < ApplicationController  
  def index
    if user_signed_in? && (current_user.name.nil? || current_user.email.nil?)
      redirect_to edit_user_registration_path, notice: "Please fill in your name and email!"
    end
  end

  def about
  end
end