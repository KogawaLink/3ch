class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :name
      t.integer :newthread_id

      t.timestamps
    end
  end
end
