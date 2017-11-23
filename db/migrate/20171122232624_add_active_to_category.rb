class AddActiveToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :active, :boolean
  end
end
