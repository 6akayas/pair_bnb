class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  has_many :braintree
  # validates :start_date, :end_date, :overlap => {:message_title => "Not available!", :message_content => "Sorry! Those dates are not available."}

 #  # Return a scope for all interval overlapping the given interval, including the given interval itself
 # named_scope :overlapping, lambda { |interval| {
 #   :conditions => ["id <> ? AND (DATEDIFF(start_date, ?) * DATEDIFF(?, end_date)) >= 0", interval.id, interval.end_date, interval.start_date]
 # }}
end
