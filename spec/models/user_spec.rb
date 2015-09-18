require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.alphabetized' do
    it 'returns users in order of their name' do
      two = FactoryGirl.create(:user, name: 'Zebra Joe')
      one = FactoryGirl.create(:user, name: 'Apples McGee')

      expect(described_class.alphabetized).to eq [one, two]
    end
  end
end
