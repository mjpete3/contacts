class CreateAddressinfos < ActiveRecord::Migration
  def change
    create_table :addressinfos do |t|
      t.integer :people_id, :null => false
      t.string :type_ident, :limit =>30, :null => false
      t.string :type_name, :limit =>50, :null => false
      t.string :address1, :null => true, :limit => 50
      t.string :address2, :null => true, :limit => 50
      t.string :city, :null => true, :limit => 25
      t.string :state, :null => true, :limit => 10
      t.string :zip, :null => true, :limit => 11

      t.timestamps
    end
  end
end
