class AddMinusToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :minus, :integer
  end
end
