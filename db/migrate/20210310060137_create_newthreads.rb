class CreateNewthreads < ActiveRecord::Migration[5.2]
  def change
    create_table :newthreads do |t|
      t.string :title
      t.string :name
      t.string :pw
      t.string :ip_address, null: false
      t.timestamps
    end
  end
end
