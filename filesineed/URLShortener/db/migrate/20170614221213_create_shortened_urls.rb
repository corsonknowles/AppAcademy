class CreateShortenedUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :shortened_urls do |t|
      t.string :short_url
      t.string :long_url, null: false
      t.integer :user_id, null: false
      t.timestamps
    end

    add_index :shortened_urls, :user_id #user will not be able to add more than one URL if we make this unique
    add_index :shortened_urls, :short_url, unique: true
  end
end
