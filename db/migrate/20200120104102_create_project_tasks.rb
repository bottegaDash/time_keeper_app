class CreateProjectTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :project_tasks do |t|
      t.string :description
      t.integer :project_id

      t.timestamps
    end
  end
end
