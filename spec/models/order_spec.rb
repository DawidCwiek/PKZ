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
    it { is_expected.to validate_presence_of(:issued) }
  end

  describe "assocation" do
    it { should belong_to(:store) }
  end
end
