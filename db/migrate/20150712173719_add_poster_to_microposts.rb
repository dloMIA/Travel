class AddPosterToMicroposts < ActiveRecord::Migration
  def change
  	add_column :microposts, :poster, :integer
  end
end
