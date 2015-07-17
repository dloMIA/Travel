class RemoveLeaderFromTrips < ActiveRecord::Migration
  def change
    remove_column :trips, :leader, :string
  end
end
