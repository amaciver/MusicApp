class Addforeignkeys < ActiveRecord::Migration
  def change
    add_column :albums, :band_id, :integer
    add_column :tracks, :album_id, :integer

    add_index :albums, :band_id
    add_index :tracks, :album_id
  end
end
