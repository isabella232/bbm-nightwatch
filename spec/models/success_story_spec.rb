require 'rails_helper'

RSpec.describe SuccessStory, type: :model do
  it { is_expected.to validate_presence_of(:contributor) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_uniqueness_of(:title) }
end