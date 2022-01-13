class PostImage < ApplicationRecord
  
  belongs_to :user
  belongs_to :wardrobe
  attachment :image
  
end
