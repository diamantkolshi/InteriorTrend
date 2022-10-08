def post_to_json(post)
  {
    id: post.id,
    title: post.title,
    description: post.description,
    image_path: post_image_path(post),
    created_at: post.created_at.strftime("%FT%T"),
    ingredients: post.ingredients&.count
  }
end

def post_image_path(post)
  post.image.attached? ? rails_blob_url(post.image, only_path: true) : nil
end