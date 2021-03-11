class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title, :null => false
      t.string :genre
      t.string :description
      t.datetime :release_year
      t.integer :user_id
    end
  end
end
