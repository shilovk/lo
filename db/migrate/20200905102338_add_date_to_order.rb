class AddDateToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :date, :date
  end
end
