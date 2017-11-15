class CreateResorts < ActiveRecord::Migration[5.1]
  def change
    create_table :resorts do |t|
      t.text :name
      t.text :snowstake_url
      t.text :open_snow_id
      
      t.timestamps
    end
  end
end
