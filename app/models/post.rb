class Post < ApplicationRecord
  has_many :users, through: :post_users
  has_many :post_users, inverse_of: :post
  has_many :messages, inverse_of: :post

  belongs_to :room, inverse_of: :posts
  belongs_to :creator, class_name: "User", inverse_of: :posts

  before_save :set_edited_at, if: lambda { |p| p.title_changed? or p.link_changed? or p.content_changed? }

private
  def set_edited_at
    self.edited_at = Time.now
  end
end
