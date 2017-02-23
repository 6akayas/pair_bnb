class Listing < ApplicationRecord
    belongs_to :user
    validates :price, :home_title, :home_type, :room_type, :accomodate, :bedroom, :bathroom, :summary, :address, presence: true

end
