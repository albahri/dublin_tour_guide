class AddCostToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :cost, :decimal
  end
end
