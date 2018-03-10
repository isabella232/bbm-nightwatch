require 'rails_helper'

RSpec.describe Donation, type: :model do

  it { is_expected.to validate_presence_of(:contact_name) }
  it { is_expected.to validate_presence_of(:contact_phone) }
  it { is_expected.to validate_presence_of(:source_name) }
  it { is_expected.to validate_presence_of(:source_address) }
  it { is_expected.to validate_presence_of(:food_type) }
  it { is_expected.to validate_presence_of(:available_from) }
  it { is_expected.to validate_presence_of(:available_to) }

  it { is_expected.to validate_numericality_of(:quantity).is_greater_than_or_equal_to(50) }
end
