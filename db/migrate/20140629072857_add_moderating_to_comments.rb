class AddModeratingToComments < ActiveRecord::Migration
  def change
    add_column :comments, :moderating, :boolean, default: true
  end
end
