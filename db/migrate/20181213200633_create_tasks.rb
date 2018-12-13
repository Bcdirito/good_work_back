class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :list_id
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
