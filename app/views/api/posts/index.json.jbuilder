json.posts do
  json.array! @posts, partial: 'api/posts/post', as: :post
end
