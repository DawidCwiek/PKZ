require 'rails_helper'

RSpec.describe Store, type: :model do

  context "assocation" do
    it { should have_one(:address) }
    it { should have_one(:warehouse) }
    it { should belong_to(:central) }
  end
end
