class AddImageToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :image, :string
    add_column :trips, :lead, :integer
  end
end
