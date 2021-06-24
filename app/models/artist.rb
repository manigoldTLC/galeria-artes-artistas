class Artist < ApplicationRecord
  validates :name, presence: true
  has_many :paintings
end
