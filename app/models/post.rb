class Post < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  def last_comments
    comments.where(post_id: self).order(created_at: :desc).limit(5)
  end

  def update_post_counter
    author.increment!(:posts_counter)
  end

  private :update_post_counter
end
