class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :people_id
      t.string :title, :limit => 30
      t.string :note

      t.timestamps
    end
  end
end
