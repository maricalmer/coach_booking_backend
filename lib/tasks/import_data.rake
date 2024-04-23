require 'csv'
require 'time'
require_relative '../time_conversion'

desc "Create coaches and 30min slots set to GMT-06:00"
task import_data: :environment do
  filename = File.join(Rails.root, 'lib', 'data', 'data.csv')
  CSV.foreach(filename, headers: true) do |row|
    coach = Coach.find_or_create_by(name: row['Name'], timezone: row['Timezone'])

    period_start = Date.parse('2024-04-24')
    period_end = Date.parse('2024-05-06')

    (period_start..period_end).each do |date|
      next unless date.strftime('%A') == row['Day of Week']

      start_time = TimeConverter.set_to_central_gmt(date, row['Available at'], row['Timezone'])
      end_time = TimeConverter.set_to_central_gmt(date, row['Available until'], row['Timezone'])

      create_30_min_slots(coach, start_time, end_time)
    end
  end
end

def create_30_min_slots(coach, start_time, end_time)
  while start_time < end_time
    slot_end_time = start_time + 30.minutes
    Slot.create!(
      coach: coach,
      start_time: start_time,
      end_time: slot_end_time,
      booked: false
    )
    start_time = slot_end_time
  end
end
