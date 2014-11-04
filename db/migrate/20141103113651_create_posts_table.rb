class CreatePostsTable < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.integer :user_id, index: true
	  	t.string :title, unique: true, index: true, null:false
	  	t.string :url
	  	t.string :text

	  	t.timestamps
  	end
  end
end
