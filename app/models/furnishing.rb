class Furnishing < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :furnishing_type, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_furnishing,
    against: [:title, :description, :location, :furnishing_type],
    using: {
      tsearch: { prefix: true }
    }
end
