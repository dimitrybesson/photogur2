class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :artist
      t.string :title
      t.string :url

      t.timestamps null: false
    end
  end
end
