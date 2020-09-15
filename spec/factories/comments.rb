FactoryBot.define do
  factory :comment do
    user 
    post 
    content { "MyString" }
  end
end
