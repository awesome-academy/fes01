class CreateDetailExcercises < ActiveRecord::Migration[5.2]
  def change
    create_table :detail_excercises do |t|
      t.integer :question_id
      t.integer :excercise_id
      t.string :answer_id

      t.timestamps
    end
  end
end
