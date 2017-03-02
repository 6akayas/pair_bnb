class Static < ApplicationRecord
  include PgSearch
  scope :sorted, ->{ order(name: :asc) }
  pg_search_scope :search,
  :against => [:price, :home_title, :address, :bedroom]
end
