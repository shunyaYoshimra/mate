json.set! :comments do
  json.array! @comments do |comment|
    json.extract! comment, :id, :content, :created_at
    json.extract! comment.user, :username
  end
end