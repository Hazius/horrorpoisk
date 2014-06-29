class AddDayMonthToFilms < ActiveRecord::Migration
  def change
    add_column :films, :day_month, :string
  end
end
