class AddPictureToStates < ActiveRecord::Migration[5.1]
  def change
    add_column :states, :picture_url, :text
  end
end
