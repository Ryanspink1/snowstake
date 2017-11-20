class AddTwitterToStates < ActiveRecord::Migration[5.1]
  def change
    add_column :states, :twitter_url, :text
  end
end
