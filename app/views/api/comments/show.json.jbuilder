json.set! :comment do
  json.extract! @comment, :id, :content, :created_at
  json.extract! @comment.user, :username
end
