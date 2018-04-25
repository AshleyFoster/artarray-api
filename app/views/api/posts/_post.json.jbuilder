json.(
  post,
  :id,
  :created_at,
  :title,
  :description,
  :user,
)
json.image_url url_for(post.image)
