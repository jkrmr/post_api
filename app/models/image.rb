class Image < ActiveRecord::Base
  belongs_to :post

  validates :post, :url, presence: true
  validates :url, url: true
end
