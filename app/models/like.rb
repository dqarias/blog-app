class Like < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  belongs_to :post, foreign_key: 'post_id'

  def update_like_counter
    Post.increment!(:likes_counter)
  end
end
