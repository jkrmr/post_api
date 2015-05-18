class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :commentable, polymorphic: true
  has_ancestry

  validates :content, :commentable_id, :commentable_type, presence: true

  def make_child_of(id:)
    parent = Comment.find_by(id: id)

    if parent.nil?
      errors.add(:ancestry, 'Parent comment not found.')
    else
      self.ancestry = parent.id
    end
  end
end
