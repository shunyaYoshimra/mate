json.set! :message do
  json.extract! @message, :id, :content, :created_at, :user_id
  json.extract! @message.user, :username
end