class CreateReactions < ActiveRecord::Migration[5.0]
  def change
    create_table :reactions do |t|
      t.belongs_to :remark, foreign_key: true, null: false

      t.timestamps
    end
  end
end
