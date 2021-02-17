class Review < ApplicationRecord
  belongs_to :garden
  validates :rating, presence: true
end
