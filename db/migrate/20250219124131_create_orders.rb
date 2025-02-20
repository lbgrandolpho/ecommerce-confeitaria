class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :total_weight
      t.decimal :total_price
      t.text :address
      t.string :status

      t.timestamps
    end
  end
end
