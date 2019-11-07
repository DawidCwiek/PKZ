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

  describe "assocation_polymorphic" do
    it { should belong_to(:central) }
  end
end
