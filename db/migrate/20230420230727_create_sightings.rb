class CreateSightings < ActiveRecord::Migration[7.0]
  def change
    create_table :sightings do |t|
      t.float :longitude
      t.float :latitude
      t.date :date
      t.integer :animal_id
      t.timestamps
    end
  end
end
