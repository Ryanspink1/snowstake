class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
      t.text :name
      t.text :abbreviation
    end
  end
end
