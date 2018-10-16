class DonationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  def index
    @donations = Donation.order(available_from: :desc).all
  end

  def my
    @transports_of_my_donations = Transport.includes(:donation, :transporter)
                                           .where(donations: {status: :assigned, user: current_user})
                                           .order('donations.available_to')
    @my_available_donations = current_user.donations.available.order(available_to: :asc)
  end

  def archive
    @donations = Donation.archive.order(available_from: :desc)
  end

  def show
  end

  def new
    last_donation = current_user.donations.last
    @donation = current_user.donations.new contact_name: current_user.name,
                                           contact_phone: current_user.phone,
                                           source_name: last_donation&.source_name,
                                           source_address: last_donation&.source_address,
                                           available_from: Time.current,
                                           available_to: 2.hours.from_now
  end

  def create
    @donation = current_user.donations.new donation_params

    if @donation.save
      User.to_be_notified_in_email.each do |user|
        DonationMailer.created_notification(@donation, user).deliver_later
      end

      redirect_to thank_you_donations_url
    else
      render :new
    end
  end

  def destroy
    @donation = current_user.donations.find params[:id]

    transports = @donation.transports
    food_type = @donation.food_type
    quantity = @donation.quantity

    @donation.destroy

    transports.each do |transport|
      DonationMailer.revocated_notification(food_type, quantity, transport.transporter).deliver_later
    end

    redirect_to my_donations_path
  end

  private

  def set_donation
    @donation = Donation.find params[:id]
  end

  def donation_params
    params.require(:donation).permit(
      :contact_name, :contact_phone,
      :source_name, :source_address,
      :food_type, :quantity,
      :available_from, :available_to,
      :comment, :anonymous,
      :not_perishable, :packaged
    )
  end
end
