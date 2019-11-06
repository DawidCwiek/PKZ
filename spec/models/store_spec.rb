require 'rails_helper'

RSpec.describe Store, type: :model do

  context "assocation" do
    it { should have_one(:address) }
  end
end
