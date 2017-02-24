class Listing < ApplicationRecord
    belongs_to :user
    validates :price, :home_title, :home_type, :room_type, :accomodate, :bedroom, :bathroom, :summary, :address, presence: true
    has_many :reservations
    mount_uploaders :photos, PhotoUploader
end
