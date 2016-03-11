class AddDescriptionToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :description, :string
  end
end
