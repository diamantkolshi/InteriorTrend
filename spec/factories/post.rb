FactoryBot.define do
  factory :post do
    project
    title { "post name" }
    description { "post description" }
    image_url { "image_url" }
  end
end
