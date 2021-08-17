class Painting < ApplicationRecord
  belongs_to :artstyle
  belongs_to :artist
  has_one_attached :image
  
  validates :name, :artist_id, :art_style_id, :description, presence: true
end
