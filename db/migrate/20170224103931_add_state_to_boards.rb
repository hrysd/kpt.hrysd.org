class AddStateToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :state, :integer, default: 0, null: false
  end
end
