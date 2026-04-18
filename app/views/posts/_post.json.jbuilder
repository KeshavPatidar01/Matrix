json.extract! post, :id, :post_title, :post_description, :images, :video_url, :topic_id, :created_at, :updated_at
json.url post_url(post, format: :json)
json.post_description post.post_description.to_s
