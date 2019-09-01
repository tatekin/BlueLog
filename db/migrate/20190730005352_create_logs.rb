class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :place
      t.date :date
      t.string :point
      t.references :user, foreign_key: true
      t.time :En
      t.time :Ex
      t.integer :Dt
      t.float :Max
      t.float :Ave
      t.integer :Cl
      t.float :Temp
      t.text :fish
      t.text :image
      t.timestamps
    end
  end
end
