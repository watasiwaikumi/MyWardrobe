class Tag < ApplicationRecord
  has_many :tagmaps, dependent: :destroy
  has_many :post_images, through: :tagmaps
end
