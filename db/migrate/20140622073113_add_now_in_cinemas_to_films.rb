class AddNowInCinemasToFilms < ActiveRecord::Migration
  def change
    add_column :films, :now_in_cinemas, :boolean, default: false
    add_column :films, :future_in_cinemas, :boolean, default: false
  end
end
