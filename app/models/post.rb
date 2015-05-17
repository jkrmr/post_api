class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy, counter_cache: true
  has_many :images, dependent: :destroy, counter_cache: true

  validates :author, :title, :content, presence: true
end
