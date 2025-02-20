class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :flavors, through: :order_items

  validates :address, presence: true
  validates :total_weight, numericality: { greater_than_or_equal_to: 1 }

  accepts_nested_attributes_for :order_items, allow_destroy: true

  before_validation :calculate_total_price
  before_validation :calculate_total_weight

  def calculate_total_price
    self.total_price = order_items.map do |item|
      item.flavor&.price_per_kg.to_f * item.weight.to_f
    end.sum
  end

  def calculate_total_weight
    self.total_weight = order_items.map do |item|
      item.weight.to_f
    end.sum
  end
end
