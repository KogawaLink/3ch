class CreateNewthreads < ActiveRecord::Migration[5.2]
  def change
    create_table :newthreads do |t|
      t.string :title
      t.string :over_view
      t.string :name
      t.string :pw

      t.timestamps
    end
  end
end
