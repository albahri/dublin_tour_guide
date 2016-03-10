class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :place
      t.date :date
      t.time :time
      t.string :language

      t.timestamps null: false
    end
  end
end
