FactoryBot.define do
  factory :page do
    title { "MyString" }
    body { "MyText" }
    sequence 1
    user_id { 1 }
    published_at { "2013-07-16 13:33:11" }
  end
end
