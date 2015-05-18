[Post, Image, User, Comment].each(&:delete_all)

user = User.create(name: 'PostApp User', city: 'San Francisco')

posts_attrs = (1..20).map do |i|
  { title: "Post #{i}", content: "Post #{i} content." }
end

comments_attrs = (1..5).map do |i|
  { content: "Comment ##{i}" }
end

posts = Post.create(posts_attrs) do |post|
  post.author = user
  post.images.build(url: 'http://example.com/image.jpg')
end

posts.each do |post|
  post.comments.create(comments_attrs)
end
