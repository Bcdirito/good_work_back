class CreateDoctorUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :doctor_users do |t|
      t.references :user, foreign_key: true
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end
