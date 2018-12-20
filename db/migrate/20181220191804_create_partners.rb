class CreatePartners < ActiveRecord::Migration[5.2]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :email
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
