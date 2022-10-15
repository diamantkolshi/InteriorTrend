module DirectoryObjectJson 
  def directories_as_json(directory)
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
end