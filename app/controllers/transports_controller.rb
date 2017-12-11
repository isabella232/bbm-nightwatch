class TransportsController < ApplicationController
  before_action :authenticate_user!

  before_action :find_donation, only: [:new, :create]
  before_action :check_assignability, only: [:new, :create]

  before_action :find_transport, only: [:close, :finish]
  before_action :check_finishability, only: [:close, :finish]

  def new
    @transport = @donation.transports.new transporter: current_user,
                                          name: current_user.name,
                                          email: current_user.email,
                                          phone: current_user.phone
  end

  def create
    @transport = @donation.transports.new transport_params
    @transport.transporter = current_user

    if @transport.save
      @donation.assign!

      message = ::I18n.t 'transport.assigned_to', name: @transport.name
      CommentOnFacebookPostJob.perform_later @donation.facebook_post_id, message
      UpdateDonationPostOnFacebookJob.perform_later @donation.id

      flash[:success] = t('transport.succesfully_assigned')
      redirect_to @donation
    else
      render :new
    end
  end

  def index
    @transports = current_user.transports
  end

  def close
  end

  def finish
    if @transport.update_attributes transport_params
      @transport.donation.finish!
      redirect_to transports_path
    else
      @donation = @transport.donation
      render :close
    end
  end

  private

  def find_donation
    @donation = Donation.find params[:donation_id]
  end

  def find_transport
    @transport = Transport.find params[:id]
  end

  def transport_params
    params.require(:transport).permit :name, :email, :phone, :target_location
  end

  def check_assignability
    redirect_to @donation, alert: t("transport.can_not_assign") unless @donation.can_assign?
  end

  def check_finishability
    unless @transport.transporter == current_user && @transport.donation.can_finish?
      redirect_to @transport.donation, alert: t("transport.can_not_finish")
    end
  end
end
