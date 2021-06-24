class ArtStyle < ApplicationRecord
  validates :name, :description, presence: true
  validates_length_of :name, minimum: 3
  validates_length_of :description, maximum: 200
end
