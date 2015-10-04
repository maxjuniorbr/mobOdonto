class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :patient, :limit => 100
      t.date :birth
      t.string :nationality, :limit => 100
      t.integer :marital_status_id
      t.integer :indication_patient
      t.references :health_plan, index: true, foreign_key: true
      t.string :email, :limit => 100

      t.timestamps null: false
    end
  end
end
