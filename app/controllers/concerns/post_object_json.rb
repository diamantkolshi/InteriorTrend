module PostObjectJson 
  def posts_to_json(post)
    {
      id: post.id,
      title: post.title,
      description: post.description,
      image_path: post.image.attached? ? rails_blob_url(post.image, only_path: true) : nil,
      created_at: post.created_at.strftime("%FT%T"),
      ingredients_count: post.ingredients&.count
    }
  end

  def post_to_json(post)
    posts_to_json(post).merge(
      {
        ingredients: post.ingredients.map do |ingredient|
          {
            name: ingredient.name,
            price: ingredient.price,
            position_x: ingredient.position_x,
            position_y: ingredient.position_y,
            created_at: post.created_at.strftime("%FT%T"),
            style: style(ingredient),
            category: category(ingredient),
            form: form(ingredient),
            colors: ingredient.colors.map do |color|
              {
                id: color.id,
                name: color.name,
                hex: color.hex,
              }
            end,
            materials: ingredient.materials.map do |material|
              {
                id: material.id,
                name: material.name,
              }
            end,
          }
        end
      }
    )
  end

  def style(ingredient)
    retun nil if ingredient.style.nil?

    {
      id: ingredient.style.id,
      name: ingredient.style.name,
    } 
  end

  def category(ingredient)
    retun nil if ingredient.category.nil?

    {
      id: ingredient.category.id,
      name: ingredient.category.name,
    } 
  end

  def form(ingredient)
    retun nil if ingredient.form.nil?

    {
      id: ingredient.form.id,
      name: ingredient.form.name,
    } 
  end
end