class Car < ApplicationRecord
    belongs_to :user
    has_one_attached :picture
    enum transmission: { Automatic: 0, Manual: 1 }
end
