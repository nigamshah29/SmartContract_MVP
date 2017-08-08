class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :type
      t.integer :budget
      t.integer :harvest_id
      t.references :client, foreign_key: true
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
