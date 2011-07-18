class CreateContactinfos < ActiveRecord::Migration
  def change
    create_table :contactinfos do |t|
      t.integer :people_id, :null => false
      t.string :type_ident, :limit =>30, :null => false
      t.string :type_name, :limit =>50, :null => false
      t.string :contact, :null => false
      t.string :comment

      t.timestamps
    end
  end
end
