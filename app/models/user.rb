class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :wardrobes
  has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :calendars
  # attachment :profile_image, destroy: false

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true

  def self.search_for(content, method)
    if method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name LIKE ?', "#{content}%")
    elsif method == 'backward'
      User.where('name LIKE ?', "%#{content}")
    else
      User.where('name LIKE ?', "%#{content}%")
    end
  end
end
