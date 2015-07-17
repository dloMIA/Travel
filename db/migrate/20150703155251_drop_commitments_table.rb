class DropCommitmentsTable < ActiveRecord::Migration
  def change
  	drop_table :commitment
  end
end
