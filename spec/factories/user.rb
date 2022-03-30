FactoryBot.define do
  factory :user do
    email { "email@mail.com" }
    encrypted_password { User.new.send(:password_digest, 'password') }
    name { "Name" }
    surname { "Surname" }
    role_id { 1 }
    nationality_id { 1 }
    city_id { 1 }
    street { "street 1" }
    phone_number { "+12312415123" }
    website { "www.google.com" }
  end
end
