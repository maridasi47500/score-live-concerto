class CreateFragments < ActiveRecord::Migration[7.1]
  def change
    create_table :fragments do |t|
      t.string :time
      t.string :key
      t.string :title
      t.text :content
      t.integer :composer_id

      t.timestamps
    end
  end
end
