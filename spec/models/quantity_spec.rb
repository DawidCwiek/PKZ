require 'rails_helper'

RSpec.describe Quantity, type: :model do
  it { expect(subject.attributes).to include('quantity') }
end
