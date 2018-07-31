json.partial! "trails/trail", trail: @trail
json.posts do
  json.array! @trail.posts, partial: 'posts/post', as: :post
end