class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.integer :patient_id
      t.string :name

      t.timestamps null: false
    end
  end
end
