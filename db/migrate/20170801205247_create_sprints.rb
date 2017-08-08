class CreateSprints < ActiveRecord::Migration[5.1]
  def change
    create_table :sprints do |t|
      t.references :project, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :progress
      t.string :status

      t.timestamps
    end
  end
end
