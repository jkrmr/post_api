class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :comments, dependent: :destroy, counter_cache: true
  has_many :images, dependent: :destroy, counter_cache: true

  validates :author, :title, :content, presence: true

  default_scope { where(archived: false) }
  scope :most_recent, -> { order(created_at: :desc).first(10) }

  def archive
    self.archived = true
    save
  end
end
