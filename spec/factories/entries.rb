FactoryBot.define do
  factory :entry do
    journal
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph(sentence_count: 2) }
    entry_date { "2024-01-14" }
  end
end
