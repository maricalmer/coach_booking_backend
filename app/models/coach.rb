class Coach < ApplicationRecord
  has_many :slots, dependent: :destroy
  validates :name, :timezone, presence: true
end

