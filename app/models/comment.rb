class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :nested_comments, class_name: "Comment", as: :commentable, dependent: :destroy
end
