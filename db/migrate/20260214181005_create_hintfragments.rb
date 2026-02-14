class CreateHintfragments < ActiveRecord::Migration[7.1]
  def change
    create_table :hintfragments do |t|
      t.string :time
      t.string :key
      t.string :title
      t.string :content
      t.integer :clip_id
      t.string :comment

      t.timestamps
    end
  end
end
