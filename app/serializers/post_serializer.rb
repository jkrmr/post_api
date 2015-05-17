# returns id, title, author_name, author_city, array of images
class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :author_name, :author_city
  has_many :images

  def author_name
    object.author.name
  end

  def author_city
    object.author.city
  end
end
