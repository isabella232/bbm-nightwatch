require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to allow_value('user@example.com').for(:email) }
end
