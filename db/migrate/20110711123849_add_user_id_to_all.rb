class AddUserIdToAll < ActiveRecord::Migration
  def change
    add_column :addressinfos, :user_id, :integer, :null => false
    add_column :contactinfos, :user_id, :integer, :null => false
    add_column :contacttypes, :user_id, :integer, :null => false
    add_column :notes, :user_id, :integer, :null => false
    add_column :people, :user_id, :integer, :null => false
  end
end
