class AddRusEngNameToFilms < ActiveRecord::Migration
  def change
    add_column :films, :name_eng, :string
    rename_column :films, :name, :name_rus
  end
end
