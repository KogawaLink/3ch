class CreateNewthreads < ActiveRecord::Migration[5.2]
  def change
    create_table :newthreads do |t|
      t.string :title
      t.string :password

      t.timestamps
    end
  end
end
