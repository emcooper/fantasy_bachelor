class AddHeadshotToContestants < ActiveRecord::Migration[5.1]
  def change
    add_column :contestants, :headshot, :string
  end
end
