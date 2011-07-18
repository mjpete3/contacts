class CreateContacttypes < ActiveRecord::Migration
  def change
    create_table :contacttypes do |t|
      #type_ident is one of the specific values: email, phone or address
      t.string :type_ident, :limit =>30, :null => false
      #type_name is the description of the type of email or type of phone number (ie: work, home, cell)
      t.string :type_name, :limit =>50, :null => false

      t.timestamps
    end
  end
end
