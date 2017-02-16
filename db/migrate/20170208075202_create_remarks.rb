class CreateRemarks < ActiveRecord::Migration[5.0]
  def change
    create_table :remarks do |t|
      t.integer :kind, null: false
      t.string :content, null: false

      t.belongs_to :board, foreign_key: true, null: false

      t.timestamps
    end
  end
end
