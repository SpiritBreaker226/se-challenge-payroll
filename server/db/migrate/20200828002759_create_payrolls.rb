class CreatePayrolls < ActiveRecord::Migration[6.0]
  def change
    create_table :payrolls do |t|
      t.date :payroll_date, null: false
      t.decimal :hours, null: false, precision: 2, scale: 2
      t.integer :payroll_id, null: false
      t.references :employee, null: false, foreign_key: true
      t.references :job_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
