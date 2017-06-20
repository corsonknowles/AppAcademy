class ArtworkShare < ApplicationRecord
  validates :artwork_id, presence: true
  validates :viewer_id, uniqueness: { scope: :artwork_id,
  message: "a user cannot have a single artwork shared with them more than once"}


  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork

end
