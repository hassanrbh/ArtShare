# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Drop All The Tables
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

# User Data

hassan = User.create!(:username => "hassan")
salman = User.create!(:username => "salman")
aya = User.create!(:username => "aya")
najat = User.create!(:username => "najat")

# Artwork Data

hassan_artwork = Artwork.create!(
    :title => "Whoops",
    :image_url => "https://imgur.com/gallery/ya873n0",
    :artist_id => hassan.id
)

salman_artwork = Artwork.create!(
    :title => "Persian Empire",
    :image_url => "https://imgur.com/gallery/0wzRsEF",
    :artist_id => salman.id
)

aya_artwork = Artwork.create!(
    :title => "Perfect",
    :image_url => "https://imgur.com/gallery/7Cv7AHa",
    :artist_id => aya.id
)

najat_artwork = Artwork.create!(
    :title => "The foundation of politics",
    :image_url => "https://imgur.com/gallery/9zjDM4P",
    :artist_id => najat.id
)

# Artwork Share

artwork_share_1 = ArtworkShare.create!(
    :artwork_id => hassan_artwork.id,
    :viewer_id => salman.id
)

artwork_share_2 = ArtworkShare.create!(
    :artwork_id => salman_artwork.id,
    :viewer_id => hassan.id
)

artwork_share_3 = ArtworkShare.create!(
    :artwork_id => aya_artwork.id,
    :viewer_id => najat.id
)

artwork_share_1 = ArtworkShare.create!(
    :artwork_id => najat_artwork.id,
    :viewer_id => aya.id
)
