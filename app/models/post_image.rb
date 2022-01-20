class PostImage < ApplicationRecord
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps
  belongs_to :user
  belongs_to :wardrobe
  attachment :image

  def save_post_images(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    old_tags.each do |old_name|
      tag = Tag.find_by(name: old_name)
      target_tagmap = self.tagmaps.find_by(tag_id: tag.id)
      if target_tagmap.present?
        target_tagmap.destroy
      end
    end

    new_tags.each do |new_name|
      post_image_tag = Tag.find_or_create_by(name: new_name)
      self.tags << post_image_tag
    end
  end

  def self.search_for(content, method)
    if method == 'perfect'
      PostImage.where(item_name: content)
    elsif method == 'forward'
      PostImage.where('name LIKE ?', "#{content}%")
    elsif method == 'backward'
      PostImage.where('name LIKE ?', "%#{content}")
    else
      PostImage.where('name LIKE ?', "%#{content}%")
    end
  end

end
