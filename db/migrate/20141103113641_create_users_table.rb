class CreateUsersTable < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :username, unique: true, index: true, null:false
	  	t.string :password, null:false

	  	t.timestamp
  	end
  end
end
