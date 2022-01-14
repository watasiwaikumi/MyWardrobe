class PostImage < ApplicationRecord
  
  belongs_to :user
  belongs_to :wardrobe
  attachment :image
  # has_many :post_tags,dependent: :destroy
  # has_many :tags,through: :post_tags
  
end
