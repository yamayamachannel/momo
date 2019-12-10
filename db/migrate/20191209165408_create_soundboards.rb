class CreateSoundboards < ActiveRecord::Migration[5.2]
  def change
    create_table :soundboards do |t|
      t.text :opinion
      t.text :history
      t.text :support
      t.timestamps
    end
  end
end
