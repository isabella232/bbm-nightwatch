require 'rails_helper'

RSpec.describe Transport, type: :model do
  it { is_expected.to validate_presence_of(:phone) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to allow_value('user@example.com').for(:email) }
end
