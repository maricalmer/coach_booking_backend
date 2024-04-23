require 'rails_helper'

RSpec.describe Slot, type: :model do
  it 'is not valid without a start_time' do
    slot = Slot.new(start_time: nil, end_time: Time.now + 1.hour, coach_id: 1)
    expect(slot).not_to be_valid
  end

  it 'is not valid without an end_time' do
    slot = Slot.new(start_time: Time.now, end_time: nil, coach_id: 1)
    expect(slot).not_to be_valid
  end

  it 'is valid with all attributes provided' do
    coach = Coach.create(name: 'John Doe', timezone: 'UTC')
    slot = Slot.new(start_time: Time.now, end_time: Time.now + 1.hour, coach: coach)
    expect(slot).to be_valid
  end

  describe 'Associations' do
    it 'belongs to coach' do
      assoc = described_class.reflect_on_association(:coach)
      expect(assoc.macro).to eq(:belongs_to)
    end
  end
end
