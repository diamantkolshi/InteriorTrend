# Role.destroy_all
# Nationality.destroy_all
# City.destroy_all

ROLES = ["admin", "user", "company"]
puts "----- CREATE ROLES -----"
ROLES.each do |role|
  Role.create!(name: role)
  puts "+ create new role: #{role}"
end
puts "--------------------------------------"

NATIONALITIES = ["Shqipëtar", "Kosovar"]
puts "----- CREATE NATIONALITIES -----"
NATIONALITIES.each do |nationality|
  Nationality.create!(name: nationality)
  puts "+ create new nationality: #{nationality}"
end
puts "--------------------------------------"

CITIES = ["Pristina", "Prizren", "Ferizaj", "Pejë", "Gjakovë", "Gjilan", "Podujevë", "Mitrovicë", "Vushtrri", "Suharekë", "Lipjan", "Rahovec",
        "Malishevë", "Skenderaj", "Viti", "Deçan", "Istog", "Klinë", "Kamenicë", "Dragash", "Fushë Kosovë", "Kaçanik", "Shtime", "Obiliq",
        "Leposaviq", "Zveçan", "Zubin Potok", "Matiçan", "Shtërpcë", "Pozharan", "Graçanicë", "Hani i Elezit", "Junik", "Çagllavicë",
        "Malishevë", "Kllokot", "Gllogovc"]
puts "----- CREATE NATIONALITIES -----"
CITIES.each do |city|
  City.create!(name: city, nationality_id: Nationality.first.id)
  puts "+ create new city: #{city}"
end
puts "--------------------------------------"

MATERIALS = ["Glass", "Leather", "Liquid", "Metal", "Miscellaneous", "Plastik", "Stone", "Tile", "Wood"]
puts "----- CREATE MATERIALS -----"
MATERIALS.each do |material|
  Material.create!(name: material)
  puts "+ create new material: #{material}"
end
puts "--------------------------------------"

STYLES = ["Classic", "Modern", "Ethnic"]
puts "----- CREATE STYLES -----"
STYLES.each do |style|
  Style.create!(name: style)
  puts "+ create new style: #{style}"
end
puts "--------------------------------------"

COLORS = [ {name: "Black", hex: "#000000"}, {name: "Gray", hex: "#808080" }, { name: "Silver", hex: "#C0C0C0" }, {name: "White", hex: "#FFFFFF"},
           { name:"Maroon", hex: "#800000" }, { name: "Red", hex: "#FF0000" }, { name: "Olive", hex: "#808000"}, {name:"Yellow", hex: "#FFFF00"},
           {name: "Green", hex: "#008000"}, {name: "Lime", hex: "#00FF00"}, {name: "teal", hex: "#008080"}, {name: "Aqua", hex: "#00FFFF"},
           {name: "Navy", hex: "#000080"}, { name: "Blue", hex: "#0000FF"}, {name: "Purple", hex: "#800080"}, { name:"Fuchsia", hex: "#FF00FF"}]
puts "----- CREATE COLORS -----"
COLORS.each do |color|
  Color.create!(color)
  puts "+ create new color: #{color}"
end
puts "--------------------------------------"

FORMS = [ { name: "Circle", image_url: "https://3dsky.org/base-assets/circle.f128fefc9157530a147c.svg" }, { name: "Rectangular", image_url: "https://3dsky.org/base-assets/rectangle.641af5fe3401156247e9.svg" },
         { name: "Square", image_url: "https://3dsky.org/base-assets/square_hover.7a21586e8a566908ad69.svg" }, { name: "Oval", image_url: "https://3dsky.org/base-assets/oval.88ceaf3db066d191a3ad.svg" },
         { name: "Triangle", image_url: "https://3dsky.org/base-assets/triangle.29cf9f2161445a4c5ea2.svg" }, { name: "Rhomb", image_url: "https://3dsky.org/base-assets/rhomb.0180d61b126675301270.svg" },
         { name: "Polygon", image_url: "https://3dsky.org/base-assets/polygon.fbefd8d954da45ab270a.svg" }, { name: "Star", image_url: "https://3dsky.org/base-assets/star.a316a86492368e292053.svg" },
         { name:"Angle", image_url: "https://3dsky.org/base-assets/angle.d20449e3691a9fa82b94.svg" }, { name: "Vector", image_url: "https://3dsky.org/base-assets/vector.8a00965a1e64d2ea13d0.svg" } ]
puts "----- CREATE FORMS -----"
FORMS.each do |form|
 Form.create!(form)
 puts "+ create new form: #{form}"

end
puts "--------------------------------------"

FURNITURE = [ "Furniture", "Arm chair", "Bed", "Chair", "Console", "Dressing table", "Hallway", "Office funrniture", "Other" , "Other soft seating", "Rack", "Sideboard & Chest of drawer", "Sofa", "Table", "Table + Chair", "TV Wall", "Wardrobe & Display cobinets"]
BATHROOM = [ "Bathroom", "Bathroom accessories", "Bathroom furniture", "Bathtub", "Faucet", "Shower", "Toilet and Bidet", "Towel rail", "Wash basin" ]
CHILDROOM = [ "Childroom", "Bed", "Full furniture set", "Miscellaneous", "Table + Chair", "Toy", "Wardrobe" ]
DECORATION = [ "Decoration", "3D panel", "Books", "Carpets", "Clothes", "Curtain", "Decorative plaster", "Decorative set", "Footwear", "Frame", "Mirror", "Other decorative objects", "Pillows", "Sculpture", "Vase", "Watches & Clocks" ]
LIGHTING = [ "Lighting", "Ceiling lamp", "Floor lamp", "Pendant light", "Spot light", "Street lighting", "Table lamp", "Technical lighting", "Wall light" ]
KITCHEN = [ "Kitchen", "Faucet", "Food and drinks", "Kitchen", "Kitchen appliance", "Other kitchen accessories", "Sink", "Tableware" ]
TECHNOLOGY = [ "Technology", "Faucet", "Food and drinks", "Kitchen", "Kitchen appliance", "Other kitchen accessories", "Sink", "Tableware" ]
PLANTS = [ "Plants", "Bouquet", "Bush", "Fitowall", "Grass", "Indoor", "Outdoor", "Tree" ]
OTHER_MODELS = [ "Other Models", "Beauty salon", "Billiards", "Creature", "Doors", "Fireplace", "Miscellaneous", "Musical instrument", "Radiator", "Restaurant", "Shop", "Sports", "Staircase", "Transport", "Weapon", "Windows" ]
CATEGORIES = %w(FURNITURE BATHROOM CHILDROOM DECORATION LIGHTING KITCHEN TECHNOLOGY PLANTS OTHER_MODELS)
puts "----- CREATE CATEGORES -----"
CATEGORIES.each do |item|
  eval(item).each_with_index do |category, index|
    if index == 0
      @main_category = Category.create!(name: category)
      puts "--------------------------------------"
      puts "+ create new main category: #{category}"
    else
      Category.create!(name: category, parent_id: @main_category.id)
      puts "++ create new sub category: #{category} | of #{@main_category.name}"
    end
  end
end


USERS = [ {email: "admin@mail.com", password: "password", password_confirmation: "password", name: "Admin", surname: "Admin", role_id: 1, nationality_id: 1, city_id: 1, street: "street 1", phone_number: "+12312415123", website: "www.google.com"},
          {email: "knapp@mail.com", password: "password", password_confirmation: "password", name: "Knapp", surname: "Knapp", role_id: 3, nationality_id: 1, city_id: 1, street: "street 1", phone_number: "+12312415123", website: "www.google.com"} ]
puts "----- CREATE USERS -----"
USERS.each do |user|
  User.create!(user)
  puts "+ create new user: #{user[:email]}"
end
puts "--------------------------------------"
