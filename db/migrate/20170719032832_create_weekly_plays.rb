class CreateWeeklyPlays < ActiveRecord::Migration[5.1]
  def change
    create_table :weekly_plays do |t|
      t.references :week, foreign_key: true
      t.references :play, foreign_key: true

      t.timestamps
    end
  end
end
