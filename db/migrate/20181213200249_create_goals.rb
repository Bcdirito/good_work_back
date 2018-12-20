class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.references :user, index: true
      t.string  :name

      t.timestamps
    end
  end
end
