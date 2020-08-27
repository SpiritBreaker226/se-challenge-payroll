class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :employee_id, null: false, limit: 50

      t.timestamps
    end
  end
end
