class Post < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_post_counter

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def last_comments
    comments.where(post: self).order(created_at: :desc).limit(5)
  end

  private :update_post_counter
end
