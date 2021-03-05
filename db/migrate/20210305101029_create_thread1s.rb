class CreateThread1s < ActiveRecord::Migration[5.2]
  def change
    create_table :thread1s do |t|
      t.string :threadid
      t.string :title

      t.timestamps
    end
  end
end
