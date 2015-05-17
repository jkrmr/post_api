class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy, counter_cache: true

  validates :name, :city, presence: true
end
