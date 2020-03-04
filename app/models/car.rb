class Car < ApplicationRecord
   
    enum transmission: { Automatic: 0, Manual: 1 }
    enum air_conditioning: { Yes: 0, No: 1}
    # validates :model, :make, :cost, presence: true
    # validates :transmission, acceptance: {accept: true}, if: :set_transmission?

    belongs_to :user
    has_one_attached :picture
end
