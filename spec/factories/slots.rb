FactoryBot.define do
  factory :slot do
    coach
    start_time { 1.hour.from_now }
    end_time { 2.hours.from_now }
    booked { false }
  end
end
