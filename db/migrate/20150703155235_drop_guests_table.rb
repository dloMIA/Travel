class DropGuestsTable < ActiveRecord::Migration
  def change
  	drop_table :guest
  end
end
