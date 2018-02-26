class Post < ApplicationRecord
  belongs_to :trail
  belongs_to :user, optional: true

  validates :trail_id, presence: true
  validates :snow_condition, presence: true
  validates :crowd_level, presence: true
  validates :star_rating, presence: true

end
