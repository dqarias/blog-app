class Post < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  has_many :comments
  has_many :likes

  def update_post_counter 
    author.increment!(:posts_counter)
  end

  def last_comments 
    Comments.where(post: self).order(created_at: :desc).limit(5)
  end
end
