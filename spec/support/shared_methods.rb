def post_to_json(post)
  {
    id: post.id,
    title: post.title,
    description: post.description,
    image_path: post_image_path(post),
    created_at: post.created_at.strftime("%FT%T"),
    ingredients_count: post.ingredients&.count
  }
end

def directory_to_json(post)
  {
    id: directory.id,
    name: directory.name,
    ingredients: directory.ingredients.map do |ingredient|
      { 
        name: ingredient.name,  
        price: ingredient.price,
        created_at: ingredient.created_at.strftime("%FT%T"),
        position_x: ingredient.position_x,
        position_y: ingredient.position_y,
        image_path: rails_blob_url(ingredient.post.image, only_path: true)
      }
    end,
    limit_price: directory.limit_price || 0,
    total_price: directory.total_price
  }
end

def post_image_path(post)
  post.image.attached? ? rails_blob_url(post.image, only_path: true) : nil
end