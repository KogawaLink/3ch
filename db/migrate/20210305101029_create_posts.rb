class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :postname
      t.string :comment
      t.integer :newthread_id
      t.string :post_ip, null: false
      
      t.timestamps
    end
  end
end
