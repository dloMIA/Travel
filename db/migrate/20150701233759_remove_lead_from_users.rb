class RemoveLeadFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :lead, :string
  end
end
