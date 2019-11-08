require 'rails_helper'

RSpec.describe Central, type: :model do
  
  context "assocation" do
    it { should have_one(:address) }
    it { should have_one(:warehouse) }
    it { should have_many(:stores) }
    it { should have_many(:products) }
    it { should have_and_belong_to_many(:users) }
  end
end
