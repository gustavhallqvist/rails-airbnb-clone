class Garden < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_one_attached :image
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_location,
                  against: [:location],
                  using: { tsearch: { prefix: true } }
  def average_rating
    ratings = reviews.map{ |review| review.rating}
      if ratings.count > 0
    ratings.sum / ratings.count
      else
      0
    end
  end
end
