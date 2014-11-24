class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.integer :runtime_in_minutes
      t.string :descrip

      t.timestamps
    end
  end
end
