class Comment < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  belongs_to :post, foreign_key: 'post_id'

  def update_comment_counter
    Post.increment!(:comments_counter)
  end

end
