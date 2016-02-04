class Message < ApplicationRecord
  belongs_to :room, inverse_of: :messages
  belongs_to :post, inverse_of: :messages
  belongs_to :creator, class_name: "User", inverse_of: :messages

  before_save :set_edited_at, if: lambda { |m| m.content_changed? }

private
  def set_edited_at
    self.edited_at = Time.now
  end
end
