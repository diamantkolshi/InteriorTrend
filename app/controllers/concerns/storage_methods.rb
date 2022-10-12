module StorageMethods
  extend ActiveSupport::Concern

  def post_image_path(post)
    post.image.attached? ? rails_blob_url(post.image, only_path: true) : nil
  end
end