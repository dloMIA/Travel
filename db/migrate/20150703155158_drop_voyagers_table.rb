class DropVoyagersTable < ActiveRecord::Migration
  def change
  	drop_table :voyager
  end
end
