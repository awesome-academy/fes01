class CreateExcercises < ActiveRecord::Migration[5.2]
  def change
    create_table :excercises do |t|
      t.integer :lesson_id
      t.integer :user_id
      t.integer :status
      t.integer :result

      t.timestamps
    end
  end
end
