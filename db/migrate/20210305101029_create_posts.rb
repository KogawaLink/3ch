class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :postname
      t.text :comment
      t.integer :newthread_id
      t.string :ip_address, null: false
      
      t.timestamps
    end
  end
end
