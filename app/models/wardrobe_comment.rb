class WardrobeComment < ApplicationRecord
  belongs_to :wardrobe
  belongs_to :user
  
  validates :comment, presence: true
  
end
