class NotificationsController < ApplicationController
  def index
    if user_signed_in?
      @notifications = Notification.where(destinataires: current_user.id)
    end
  end

end