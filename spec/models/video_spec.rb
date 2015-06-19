require 'rails_helper'

RSpec.describe Video, type: :model do
  describe '.ordered' do
    it 'returns videos published more recently first' do
      two = described_class.create(published_at: 4.days.ago)
      one = described_class.create(published_at: 1.day.ago)

      expect(described_class.ordered).to eq [one, two]
    end
  end
end
