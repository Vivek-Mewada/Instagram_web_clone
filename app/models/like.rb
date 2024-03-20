class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true

  # after_create_commit { broadcast_append_to 'likes_count' }
end
