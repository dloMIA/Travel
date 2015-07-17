class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.string :dest
      t.string :month
      t.string :desc
      t.string :leader

      t.timestamps null: false
    end
    
    
  end
end
