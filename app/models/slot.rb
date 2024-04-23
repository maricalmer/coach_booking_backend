class Slot < ApplicationRecord
  belongs_to :coach
  validates :start_time, :end_time, presence: true
end
