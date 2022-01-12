class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :wardrobe

  validates_uniqueness_of :wardrobe_id, scope: :user_id
  
end
