class KueSettingsTableCreateMigration < ActiveRecord::Migration
 def up
  create_table :kue_settings, :id => false do |t|
   t.string :key
   t.text :value
      
   t.timestamps
  end
  add_index :kue_settings, :key, :unique => true
 end
       
 def down
  drop_table :kue_settings
 end
end
