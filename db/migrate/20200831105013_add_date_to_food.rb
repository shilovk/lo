class AddDateToFood < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :date, :date, null: false
  end
end
