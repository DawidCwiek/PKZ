require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe 'attributes' do
    it { expect(subject.attributes).to include('name') }
    it { expect(subject.attributes).to include('active') }
  end

  describe 'validation' do 
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:central_id) }
  end

  describe "assocation" do
    it { should belong_to(:central) }
    it { should have_and_belong_to_many(:products) }
  end
end
