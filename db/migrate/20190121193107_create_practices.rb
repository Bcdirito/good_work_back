class CreatePractices < ActiveRecord::Migration[5.2]
  def change
    create_table :practices do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end
