class CreateClips < ActiveRecord::Migration[7.1]
  def change
    create_table :clips do |t|
      t.integer :fragment_id
      t.string :title
      t.string :link
      t.string :description
      t.string :sortie
      t.string :image
      t.string :artist
      t.string :mytime

      t.timestamps
    end
  end
end
