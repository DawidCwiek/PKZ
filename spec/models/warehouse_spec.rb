require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe "assocation_polymorphic" do
    it { is_expected.to have_db_column(:warehousable_id).of_type(:integer) }
    it { is_expected.to have_db_column(:warehousable_type).of_type(:string) }
    it { should belong_to(:warehousable) }
  end
end
