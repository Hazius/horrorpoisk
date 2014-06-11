class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :name
      t.integer :year
      t.text :short_description
      t.text :full_description
      t.string :link_to_kinopoisk

      t.timestamps
    end
  end
end
