require 'rails_helper'

RSpec.describe Order, type: :model do
  it "não permite pedidos com menos de 1 kg" do
    flavor = Flavor.create!(id: 1, name: "Chocolate", price_per_kg: 10)
    order = Order.new(address: "Some address")
    order.order_items.new(weight: 0.5, flavor_id: flavor.id)
    expect(order.valid?).to be_falsey
  end

  it "não permite pedidos sem endereço válido" do
    flavor = Flavor.create!(id: 1, name: "Chocolate", price_per_kg: 10)
    order = Order.new(address: nil)
    order.order_items.new(weight: 2.5, flavor_id: flavor.id)
    expect(order.valid?).to be_falsey
  end

  it "permite pedidos válidos" do
    flavor = Flavor.create!(id: 1, name: "Chocolate", price_per_kg: 10)
    order = Order.new(address: "Some address")
    order.order_items.new(weight: 2.5, flavor_id: flavor.id)
    expect(order.valid?).to be_truthy
  end
end
