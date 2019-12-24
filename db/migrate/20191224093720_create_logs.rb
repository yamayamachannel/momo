class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.integer :money
      t.string :comment

      t.timestamps
    end
  end
end
