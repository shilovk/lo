class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :total_price, default: 0, null: false
      t.belongs_to :user

      t.timestamps
    end

    create_table :food_orders do |t|
      t.belongs_to :food
      t.belongs_to :order

      t.timestamps
    end
  end
end
