require 'rails_helper'

RSpec.describe Address, type: :model do

  describe 'attributes' do
    it { expect(subject.attributes).to include('street') }
    it { expect(subject.attributes).to include('city') }
    it { expect(subject.attributes).to include('zip_code') }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:zip_code) }
  end

  describe "assocation_polymorphic" do
    it { is_expected.to have_db_column(:addressable_id).of_type(:integer) }
    it { is_expected.to have_db_column(:addressable_type).of_type(:string) }
    it { should belong_to(:addressable) }
  end
  
  
end
