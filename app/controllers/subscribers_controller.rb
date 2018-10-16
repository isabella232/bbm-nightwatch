class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.find_or_create_by subscriber_params

    if @subscriber.persisted?
      notify_admins_about_subscription
      redirect_to root_path, notice: t('subscribers.create.thank_you')
    else
      render :new
    end
  end

  private

  def notify_admins_about_subscription
    User.admins.each do |user|
      SubscriberMailer.new_subscription_notification(user, @subscriber).deliver_later
    end
  end

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
