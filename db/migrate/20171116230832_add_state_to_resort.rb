class AddStateToResort < ActiveRecord::Migration[5.1]
  def change
    add_reference :resorts, :state, foreign_key: true
  end
end
