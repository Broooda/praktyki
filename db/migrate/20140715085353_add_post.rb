class AddPost < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.string :content
  		t.timestamp :time
  	end
  end
end
