class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :snow_condition
      t.string :crowd_level
      t.string :star_rating
      t.string :notes
      t.belongs_to :trail, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
