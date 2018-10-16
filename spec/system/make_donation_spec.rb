require "rails_helper"

RSpec.describe "Make donations", type: :system do
  let(:user) { create :user }

  before { login_as(user, scope: :user) }

  around do |example|
    Sidekiq::Testing.inline! { example.run }
  end

  it "enables the users to make their donations" do
    visit root_path
    click_on "Felajánlások"
    click_on "Étel felajánlása"

    fill_in "Felajánló neve (cég, intézmény)", with: "Adakozó Kft."
    fill_in "Átvételi cím", with: "Budapest, Kossuth tér 1."

    fill_in "Étel megnevezése", with: "szendvics"
    fill_in "Mennyiség (adag)", with: 50

    click_on "Felajánlom :)"
    expect(page).to have_content "Köszönjük a felajánlást"

    click_on "Felajánlásaim"
    expect(active_donation).to have_content "Tétel: szendvics\nCím: Budapest, Kossuth tér 1."

    expect(notification_email).to deliver_to "user1@example.com"
    expect(notification_email).to have_subject "Új felajánlás érkezett"
  end

  private

  def active_donation
    find(".active-donation")
  end

  def notification_email
    DonationMailer.deliveries.last
  end
end
