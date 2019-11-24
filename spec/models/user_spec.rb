require 'rails_helper'

RSpec.describe User, type: :model do
  
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should have_one(:address) }
  it { should validate_uniqueness_of(:email) }
  it { should have_and_belong_to_many(:centrals) }
  it { should have_many(:workers) }
  it { should have_many(:stores).through(:workers) }
end
