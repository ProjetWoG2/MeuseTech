class ProfilesController < ApplicationController
  def new
    Profile.new
    self.user = User.new(sign_up_params)
    Profile.save
  end

  def sign_up_params
  	devise_parameters_sanitizer.sanitize(:sign_up)
  end

end
