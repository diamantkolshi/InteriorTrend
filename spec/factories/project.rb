FactoryBot.define do
  factory :project do
    user
    city_id {}
    title { "project name" }
    description { "priject description" }
    street { "street" }
    location  { "location" }
    views { 22 }
  end
end
