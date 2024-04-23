class Coach < ApplicationRecord
  class Coach < ApplicationRecord
    has_many :slots, dependent: :destroy
  end
end
