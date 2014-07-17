class AddAuthor < ActiveRecord::Migration
  def change
  	create_table :authors do |t|
  		t.string :name
  		t.string :surname
  		t.string :sex
  		t.date :birthdate
  end
  end
end
