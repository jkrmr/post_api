class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_ancestry

  validates :content, :commentable_id, :commentable_type, presence: true
end
