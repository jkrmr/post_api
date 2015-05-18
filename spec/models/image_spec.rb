require 'rails_helper'

describe Image, type: :model do
  it { is_expected.to validate_presence_of(:post) }
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to belong_to(:post) }
end
