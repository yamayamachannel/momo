class AddSumToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :sum, :integer
  end
end
