json.partial! "posts/post", post: @post
json.trail do
  json.partial! 'trails/trail', trail: @post.trail
end
if @post.user
  json.user do
    json.partial! 'users/user', user: @post.user
  end
end