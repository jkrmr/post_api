class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :author_name, :author_city

  def author_name
    object.author.name
  end

  def author_city
    object.author.city
  end
end
