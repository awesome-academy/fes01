class AddDeletedAtToExcercises < ActiveRecord::Migration[5.2]
  def change
    add_column :excercises, :deleted_at, :datetime
  end
end
