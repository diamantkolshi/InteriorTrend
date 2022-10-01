FactoryBot.define do
  factory :material do
    name { "material name" }
    image_url { 'www.google.com' }
    active { true }
  end
end
