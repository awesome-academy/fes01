class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.integer :type_object_id
      t.string :trackable_type
      t.integer :trackable_id
      t.integer :user_id

      t.timestamps
    end
  end
end
