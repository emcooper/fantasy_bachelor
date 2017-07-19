class CreatePlays < ActiveRecord::Migration[5.1]
  def change
    create_table :plays do |t|
      t.text :description
      t.integer :point_value

      t.timestamps
    end
  end
end
