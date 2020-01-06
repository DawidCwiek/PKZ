require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'attributes' do
    it { expect(subject.attributes).to include('profit') }
    it { expect(subject.attributes).to include('total_price') }
    it { expect(subject.attributes).to include('issued') }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:profit) }
    it { is_expected.to validate_presence_of(:total_price) }
  end

  describe "assocation" do
    it { should belong_to(:store) }
    it { should have_and_belong_to_many(:products) }
  end
end
