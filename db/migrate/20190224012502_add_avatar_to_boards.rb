class AddAvatarToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :avatar, :string
  end
end
