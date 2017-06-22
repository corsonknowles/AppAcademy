class Visit < ApplicationRecord

  belongs_to :visitor,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :short_url,
    primary_key: :id,
    foreign_key: :shortened_urls_id,
    class_name: :ShortenedUrl

end
