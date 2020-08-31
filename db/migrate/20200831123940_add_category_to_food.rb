class AddCategoryToFood < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :category, :integer, default: 0, null: false
  end
end
