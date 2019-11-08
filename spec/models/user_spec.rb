require 'rails_helper'

RSpec.describe User, type: :model do
  
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should have_one(:address) }
  it { should have_and_belong_to_many(:centrals) }
end
