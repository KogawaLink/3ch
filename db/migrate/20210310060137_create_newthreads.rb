class CreateNewthreads < ActiveRecord::Migration[5.2]
  def change
    create_table :newthreads do |t|
      t.string :title
      t.string :overview
      t.string :name
      t.string :pw

      t.timestamps
    end
  end
end
