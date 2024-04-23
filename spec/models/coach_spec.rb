require 'rails_helper'

RSpec.describe Coach, type: :model do
  it 'is valid with valid attributes' do
    coach = Coach.new(name: 'John Doe', timezone: 'America/New_York')
    expect(coach).to be_valid
  end

  it 'is not valid without a name' do
    coach = Coach.new(name: nil, timezone: 'America/New_York')
    expect(coach).not_to be_valid
  end

  it 'is not valid without a timezone' do
    coach = Coach.new(name: 'John Doe', timezone: nil)
    expect(coach).not_to be_valid
  end

  describe 'Associations' do
    it 'has many slots' do
      expect(described_class.reflect_on_association(:slots).macro).to eq(:has_many)
    end
  end
end
