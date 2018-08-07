FactoryBot.define do
  factory :book do
    name { Faker::Name.name }
    description {Faker::Lorem.paragraph}
    author { Faker::Name.name }
    number_of_pages {Faker::Number.number(3)}
    category_id {Faker::Number.numberbetween(1, 3)}
  end
end
