class Listing < ApplicationRecord
    belongs_to :user
    validates :price, :home_title, :home_type, :room_type, :accomodate, :bedroom, :bathroom, :summary, :address, presence: true
    has_many :reservations
    mount_uploaders :photos, PhotoUploader

    include PgSearch
    scope :sorted, ->{ order(home_title: :asc) }
    pg_search_scope :search,
    :against => [:price, :home_title, :address, :bedroom]

    def self.perform_search(keyword)
      if keyword.present?
      then Listing.search(keyword)
    else Listing.all
      end.sorted
    end
end
