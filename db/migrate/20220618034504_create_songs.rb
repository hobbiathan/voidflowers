class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :album
      t.string :link
      t.string :artist

      t.timestamps
    end
  end
end
