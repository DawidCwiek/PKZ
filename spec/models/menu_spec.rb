require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe 'attributes' do
    it { expect(subject.attributes).to include('name') }
    it { expect(subject.attributes).to include('active') }
  end
end
