FactoryBot.define do
  factory :journal do
    title { "MyString" }
    status { "MyString" }
    entry_count { 1 }
    image { "MyString" }
    user { nil }
  end
end
