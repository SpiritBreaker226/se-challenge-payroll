class CreateJobGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :job_groups do |t|
      t.string :name, null: false, limit: 50
      t.decimal :hour_rate, null: false, precision: 8, scale: 2

      t.timestamps
    end
  end
end
