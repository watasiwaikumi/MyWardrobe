class Event < ApplicationRecord
  
  belongs_to :user
  
  def self.search_for(content, method)#, body=nil, start_date=nil)
    if method == 'perfect'
      # if !content.nil? && !body.nil? && !start_date.nil?
      #   Event.where(title: content, body: body, start_date: start_date)
      # else
      Event.where(title: content)
      # end
    elsif method == 'forward'
      Event.where('title LIKE ?', "#{content}%")
    elsif method == 'backward'
      Event.where('title LIKE ?', "%#{content}")
    else
      Event.where('title LIKE ?', "%#{content}%")
    end
  end
  
  def self.search_for2(content, method)#, body=nil, start_date=nil)
    if method == 'perfect'
      # if !content.nil? && !body.nil? && !start_date.nil?
      #   Event.where(title: content, body: body, start_date: start_date)
      # else
      Event.where(body: content)
      # end
    elsif method == 'forward'
      Event.where('body LIKE ?', "#{content}%")
    elsif method == 'backward'
      Event.where('body LIKE ?', "%#{content}")
    else
      Event.where('body LIKE ?', "%#{content}%")
    end
  end
  
  
end
