class Image < ActiveRecord::Base
  include Loggable
  belongs_to :post

  validates :post, :url, presence: true
  validates :url, url: true
end
