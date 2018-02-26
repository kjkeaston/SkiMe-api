json.partial! "trails/trail", trail: @trail
json.posts do
  json.array! @trail.posts.reverse, partial: 'posts/post', as: :post
end