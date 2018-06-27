json.(
  post,
  :id,
  :created_at,
  :title,
  :description,
  :likes_count,
  :user,
)
json.image_url url_for(post.image)
json.liked_by_user current_user.likes?(post)
