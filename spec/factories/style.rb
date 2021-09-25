FactoryBot.define do
  factory :style do
    name { "style name" }
    image_url { 'www.google.com' }
    active { true }
  end
end
