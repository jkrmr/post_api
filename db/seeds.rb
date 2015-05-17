[Post, Image, User, Comment].each(&:delete_all)

user = User.create(name: 'Postapp User', city: 'San Francisco')

posts_attrs = (1..20).map do |i|
  { title: "Post #{i}", content: "Post #{i} content." }
end

Post.create(posts_attrs) do |post|
  post.author = user
  post.images.build(url: 'http://example.com/image.jpg')
end

