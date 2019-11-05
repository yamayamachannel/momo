class AddColumnMemos < ActiveRecord::Migration[5.2]
  def change
    add_reference :memos, :user, foreign_key: true
  end
end
