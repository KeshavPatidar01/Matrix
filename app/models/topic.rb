class Topic < ApplicationRecord
    has_many :posts

       has_rich_text :description
    
 has_many :user_topic_progresses
   extend FriendlyId
  friendly_id :title, use: :slugged
end


