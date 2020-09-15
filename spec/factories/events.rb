FactoryBot.define do
  factory :event do
    user { nil }
    title { "MyString" }
    content { "MyText" }
    address { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
    date { "2020-09-15 11:02:01" }
    paid { false }
    price { "MyString" }
    integer { "MyString" }
  end
end
