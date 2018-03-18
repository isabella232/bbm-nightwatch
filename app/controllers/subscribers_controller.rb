class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.find_or_create_by subscriber_params

    if @subscriber.persisted?
      redirect_to root_path, notice: t('subscribers.create.thank_you')
    else
      render :new
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
