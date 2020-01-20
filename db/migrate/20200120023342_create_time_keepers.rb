class CreateTimeKeepers < ActiveRecord::Migration[6.0]
  def change
    create_table :time_keepers do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id, null: false
      t.integer :task_id, null: false

      t.timestamps
    end
  end
end
