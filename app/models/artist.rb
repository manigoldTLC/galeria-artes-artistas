class Artist < ApplicationRecord
  
  validates :name, presence: true
  has_many :paintings
  
  validates :name, :description, presence: true

end
