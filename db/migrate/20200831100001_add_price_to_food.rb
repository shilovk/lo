class AddPriceToFood < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :price, :integer, default: 0
  end
end
