FactoryBot.define do
  factory :journal do
    title { Faker::Book.title}
    status { Journal.statuses.values.sample }
    entry_count { 0 }
    description { Faker::Lorem.sentence(word_count: 5) }
    image { Faker::LoremFlickr.image(size: "50x60") }
    user
  end
end
