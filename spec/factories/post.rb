FactoryBot.define do
  factory :post do
    project
    title { "post name" }
    description { "post description" }
    image_url { "image_url" }
    image { Rack::Test::UploadedFile.new "#{Rails.root}/spec/files/images/default.jpg", "image/jpg" }
  end
end
