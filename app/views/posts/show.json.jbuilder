json.partial! "posts/post", post: @post
json.trail do
  json.partial! 'trails/trail', trail: @post.trail
end
json.user do
  json.partial! 'users/user', user: @post.user
end
