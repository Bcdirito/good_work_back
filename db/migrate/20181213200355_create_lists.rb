class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :name
      t.references :goal, index: true

      t.timestamps
    end
  end
end
