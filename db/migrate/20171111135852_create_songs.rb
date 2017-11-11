class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string  :song_name
      t.string  :album_name
      t.integer :release_date

      t.timestamps
    end
  end
end
