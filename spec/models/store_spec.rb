require 'rails_helper'

RSpec.describe Store, type: :model do

  context "assocation" do
    it { should have_one(:address) }
    it { should have_one(:warehouse) }
    it { should belong_to(:central) }
    it { should have_many(:workers) }
    it { should have_many(:users).through(:workers) }
    it { should have_many(:orders) }
  end
  context "validation" do
    it { should validate_presence_of(:name) }
  end
end
