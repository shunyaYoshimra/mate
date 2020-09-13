FactoryBot.define do
  factory :user do
    username { 'test-user' }
    email { 'test@example.com' }
    password { 'password' }
  end
end
