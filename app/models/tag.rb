class Tag < ApplicationRecord
  has_many :tagmaps, dependent: :destroy
  has_many :post_images, through: :tagmaps

  def self.search_for(content, method)
    if method == 'perfect'
      Tag.where(name: content)
    elsif method == 'forward'
      Tag.where('name LIKE ?', "#{content}%")
    elsif method == 'backward'
      Tag.where('name LIKE ?', "%#{content}")
    else
      Tag.where('name LIKE ?', "%#{content}%")
    end
  end

end
