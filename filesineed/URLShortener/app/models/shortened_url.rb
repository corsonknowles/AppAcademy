class ShortenedUrl < ApplicationRecord
  validates :user_id, :long_url, :short_url, presence: true, uniqueness: true

  def self.random_code
    result = SecureRandom::urlsafe_base64
    while ShortenedUrl.exists?(short_url: result)
      result = SecureRandom::urlsafe_base64
    end
    result
  end

  def self.urlfactory(user, longish_url)
    ShortenedUrl.create(
      user_id: user.id,
      long_url: longish_url,
      short_url: self.random_code
      )
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits
    primary_key: :id,
    foreign_key: :visit_id,
    class_name: :Visit

  # def translate_url
  #   "http:\/\/tiny.co\/#{short_url}"
  #
  # end
end
