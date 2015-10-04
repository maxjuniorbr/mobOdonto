class CreateHealthPlans < ActiveRecord::Migration
  def change
    create_table :health_plans do |t|
      t.string :name, :limit => 100

      t.timestamps null: false
    end
  end
end
