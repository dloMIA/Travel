class AddLeadToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :lead, :integer
  end
end
