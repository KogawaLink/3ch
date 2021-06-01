class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :postname, default: "名無しさん"
      t.text :comment
      t.integer :newthread_id
      t.string :ip_address, null: false
      t.string :image
      
      t.timestamps
    end
  end
end
