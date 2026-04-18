class Post < ApplicationRecord
  belongs_to :topic
  
   has_rich_text :post_description
   extend FriendlyId
  friendly_id :post_title, use: :slugged
end
