json.partial! "users/user", user: @user
json.posts do
  json.array! @user.posts, partial: 'posts/post', as: :post
end