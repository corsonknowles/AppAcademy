class Artwork < ApplicationRecord
  validates :image_url, :artist_id, presence: true
  validates :title, presence: true, uniqueness: { scope: :artist_id,
    message: "Each artist cannot reuse the same title for any of their works" }

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

  has_many :comments, dependent: :destroy,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Comment
end
