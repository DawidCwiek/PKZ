require 'rails_helper'

RSpec.describe Component, type: :model do
  describe 'attributes' do
    it { expect(subject.attributes).to include('name') }
    it { expect(subject.attributes).to include('cost') }
    it { expect(subject.attributes).to include('quantity') }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:warehouse_id) }
    it { is_expected.to validate_presence_of(:cost) }
    it { is_expected.to validate_presence_of(:quantity) }
  end

  describe "assocation_polymorphic" do
    it { should belong_to(:warehouse) }
  end
end
