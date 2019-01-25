class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :bio
      t.string :image

      t.timestamps
    end
  end
end
