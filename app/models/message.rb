class Message < ApplicationRecord
  belongs_to :room, inverse_of: :messages
  belongs_to :post, inverse_of: :messages
  belongs_to :creator, class_name: "User", inverse_of: :messages
end
