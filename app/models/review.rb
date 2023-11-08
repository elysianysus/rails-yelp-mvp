class Review < ApplicationRecord
  belongs_to :restaurant

  validates_presence_of     :restaurant
  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: [0,1,2,3,4,5]

end
