class Comment < ActiveRecord::Base
  belongs_to :post
  has_ancestry

  validates :post, :content, presence: true
end
