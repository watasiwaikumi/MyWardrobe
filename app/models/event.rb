class Event < ApplicationRecord
  
  belongs_to :user
  
  def self.search_for(content, method)
    if method == 'perfect'
      Event.where(title: content)
    elsif method == 'forward'
      Event.where('name LIKE ?', "#{content}%")
    elsif method == 'backward'
      Event.where('name LIKE ?', "%#{content}")
    else
      Event.where('name LIKE ?', "%#{content}%")
    end
  end
  
end
