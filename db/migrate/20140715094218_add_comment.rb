class AddComment < ActiveRecord::Migration
  def change 
  	create_table :comments do |t|
  		t.timestamps
  		t.string :content
  	end
  end
end
