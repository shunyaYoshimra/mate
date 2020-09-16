json.set! :messages do
  json.array! @messages do |message|
    json.extract! message, :id, :content, :created_at, :user_id
    json.extract! message.user, :username
  end
end