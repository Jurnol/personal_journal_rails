FactoryBot.define do
  factory :entry do
    journal { nil }
    title { "MyString" }
    content { "MyText" }
    entry_date { "2024-01-14" }
  end
end
