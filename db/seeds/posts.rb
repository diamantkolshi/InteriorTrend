POSTS = [
          { post: { project: Project.first, title: "Post 1", description: "Post description 1" }, image_name: 'bini1.jpeg'},
          { post: { project: Project.first, title: "Post 2", description: "Post description 2" }, image_name: 'bini2.jpeg'}
        ]
puts "----- CREATE Posts -----"
POSTS.each do |item|
  ActiveRecord::Base.transaction do
    post_created = Post.new(item[:post])
    if post_created.save
      puts "attaching image ...."
      post_created.image.attach(io: File.open("db/seeds/images/#{item[:image_name]}"), filename: item[:image_name])
    else
      puts "problem save with #{post_created.title}, errors: #{post_created.errors.full_messages}"
      raise ActiveRecord::Rollback
    end
  end
end
puts "--------------------------------------"

# INGREDIENT = [
#           { post: { project: Project.first, title: "Post 1", form: Form.first, style: Style.first, category: Category.first, price: 23.4, position_name: 'Position name 1', position_x: 178, position_y: 415, width: 954, height: 713.7, size: 45.6 }, image_name: 'bini1.jpeg'},
#           { post: { project: Project.first, title: "Post 2", form: Form.first, style: Style.first, category: Category.second, price: 15.9, position_name: 'Position name 2', position_x: 510, position_y: 469, width: 954, height: 713.7, size: 45.7 }, image_name: 'bini2.jpeg'}
#         ]
