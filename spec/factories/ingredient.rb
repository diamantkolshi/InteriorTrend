FactoryBot.define do
  factory :ingredient do
    post
    form
    style
    category
    name { "ingredient name" }
    price { 23.4 }
    position_name { "position name" }
    position_x { 0.5 }
    position_y { 0.9 }
    width { 100.0 }
    height { 100.0 }
    size { 45.5 }
  end
end
