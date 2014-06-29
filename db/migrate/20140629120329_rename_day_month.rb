class RenameDayMonth < ActiveRecord::Migration
  def change
  	rename_column :films, :day_month, :russian_premiere
  end
end
