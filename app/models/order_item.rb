class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :flavor

  validates :flavor_id, presence: true
  validates :weight, presence: true
end
