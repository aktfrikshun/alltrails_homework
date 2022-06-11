class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_places do |t|
      t.string :user_id
      t.string :place_id
      t.timestamps
    end
  end
end
