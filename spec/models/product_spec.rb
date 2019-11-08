require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'attributes' do
    it { expect(subject.attributes).to include('name') }
    it { expect(subject.attributes).to include('price') }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
  end

  describe "assocation" do
    it { should belong_to(:central) }
    it { should have_and_belong_to_many(:component) }
  end
end
