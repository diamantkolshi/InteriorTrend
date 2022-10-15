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
        }
      end,
      limit_price: directory.limit_price || 0,
      total_price: directory.total_price
    }
  end
end