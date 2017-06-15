class NotificationsController < ApplicationController
before_filter :require_user
  def index
    	@notification = Notification.where(:user_id => current_user.id)

  end

  def link_through
    @notification = Notification.where(:user_id => current_user.id)
    @notification = Notification.find(params[:id])
    @notification.update read: true
    redirect_to post_path@notification.post

  end

end

class TrueClass
  def to_s
    "Seen"
  end
end

class FalseClass
  def to_s
    "New"
  end
end
