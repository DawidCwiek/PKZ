require 'rails_helper'

RSpec.describe Component, type: :model do
  describe 'attributes' do
    it { expect(subject.attributes).to include('name') }
    it { expect(subject.attributes).to include('cost') }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cost) }
  end

  describe "accocation" do
    it { should belong_to(:central) }
    it { should have_and_belong_to_many(:products) }
  end
  
end
