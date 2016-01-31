class PostUser < ApplicationRecord
  belongs_to :post, inverse_of: :post_users
  belongs_to :user, inverse_of: :post_users
end
