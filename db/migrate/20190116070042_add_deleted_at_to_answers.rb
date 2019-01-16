class AddDeletedAtToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :deleted_at, :datetime
  end
end
