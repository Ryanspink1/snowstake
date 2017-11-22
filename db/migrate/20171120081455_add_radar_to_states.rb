class AddRadarToStates < ActiveRecord::Migration[5.1]
  def change
    add_column :states, :radar_url, :text
  end
end
