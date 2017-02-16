class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.string :permalink, null: false, unique: true
      t.string :title,     null: false

      t.timestamps
    end

    add_index :boards, :permalink, unique: true
  end
end
