class AddMemoIdToLogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :logs, :memo, foreign_key: true
  end
end
