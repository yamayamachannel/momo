class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.string :title
      t.integer :bank
      t.integer :wallet
      t.integer :sum
      t.integer :plus
      t.timestamps
    end
  end
end
