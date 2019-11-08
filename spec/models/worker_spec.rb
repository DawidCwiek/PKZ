require 'rails_helper'

RSpec.describe Worker, type: :model do

  describe 'attributes' do
    it { expect(subject.attributes).to include('manager') }
  end

  context "assocation" do
    it { should belong_to(:store) }
    it { should belong_to(:user) }
  end
end
