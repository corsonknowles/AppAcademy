# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ActiveRecord::Base.transaction do

  User.destroy_all
  user1= User.create!(username: 'jack')
  user2= User.create!(username: 'david')
  user3= User.create!(username: 'jeff')
  user4= User.create!(username: 'kelly')

  Artwork.destroy_all
  artwork1 = Artwork.create!(title: 'davidface', image_url: 'davidface', artist_id: user1.id)
  artwork2 = Artwork.create!(title: 'monalisa', image_url: 'monalisa', artist_id: user2.id)
  artwork3 = Artwork.create!(title: 'jackface', image_url: 'jackface', artist_id: user3.id)
  artwork4 = Artwork.create!(title: 'lecturesofjeff', image_url: 'lecturesofjeff', artist_id: user4.id)

  ArtworkShare.destroy_all
  artworkshare1 = ArtworkShare.create!(viewer_id: user1.id, artwork_id: artwork2.id)
  artworkshare2 = ArtworkShare.create!(viewer_id: user2.id, artwork_id: artwork3.id)
  artworkshare3 = ArtworkShare.create!(viewer_id: user3.id, artwork_id: artwork4.id)
  artworkshare4 = ArtworkShare.create!(viewer_id: user4.id, artwork_id: artwork1.id)

  Comment.destroy_all
  comment1 = Comment.create!(body: 'sick comment!', user_id: user2.id, artwork_id: artwork1.id)

end
