class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :last_name, :null => false
      t.string :first_name, :null => false
      t.string :middle_name
      t.date :dob
      
      t.timestamps
    end
  end
end

