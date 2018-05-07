json.(
  post,
  :id,
  :created_at,
  :title,
  :description,
  :user,
  :likes_count,
  :liked
)
json.image_url url_for(post.image)
