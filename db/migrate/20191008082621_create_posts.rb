class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :bank
      t.integer :wallet
      t.timestamps
    end
  end
end
