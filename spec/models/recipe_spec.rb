require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:ingredient)}
  it { is_expected.to validate_presence_of(:photo) }
end
