require 'rails_helper'

RSpec.describe Order, type: :model do
  it "não permite pedidos com menos de 1 kg" do
    order = Order.new(total_weight: 0.5)
    expect(order.valid?).to be_falsey
  end
end

RSpec.describe Order, type: :model do
  it "não permite pedidos sem endereço válido" do
    order = Order.new(address: nil)
    expect(order.valid?).to be_falsey
  end
end
