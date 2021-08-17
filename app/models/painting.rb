class Painting < ApplicationRecord
  belongs_to :art_style
  belongs_to :artist
  has_one_attached :image
  
  validates :name, :artist_id, :art_style_id, :description, presence: true
end