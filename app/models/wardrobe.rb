class Wardrobe < ApplicationRecord
  belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :wardrobe_comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
	
	def self.search_for(content, method)
    if method == 'perfect'
      Wardrobe.where(title: content)
    elsif method == 'forward'
      Wardrobe.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Wardrobe.where('title LIKE ?', '%'+content)
    else
      Wardrobe.where('title LIKE ?', '%'+content+'%')
    end
  end
end
