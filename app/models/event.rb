class Event < ApplicationRecord
  
  belongs_to :user
  
  def self.search_for(content, method)
    if method == 'perfect'
      Event.where(title: content)
    elsif method == 'forward'
      Event.where('title LIKE ?', "#{content}%")
    elsif method == 'backward'
      Event.where('title LIKE ?', "%#{content}")
    else
      Event.where('title LIKE ?', "%#{content}%")
    end
  end
  
end
