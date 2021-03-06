class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.string :martial_art
      t.integer :cost
      t.string :duration
      t.belongs_to :user
      t.timestamps
    end
  end
end
