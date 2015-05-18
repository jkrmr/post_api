class Comment < ActiveRecord::Base
  belongs_to :post
  has_ancestry

  validates :content, :commentable_id, :commentable_type, presence: true
end
