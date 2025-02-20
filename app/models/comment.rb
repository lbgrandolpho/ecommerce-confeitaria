class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :flavor
  has_one_attached :image
end
