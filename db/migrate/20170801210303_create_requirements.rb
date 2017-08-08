class CreateRequirements < ActiveRecord::Migration[5.1]
  def change
    create_table :requirements do |t|
      t.references :sprint, foreign_key: true
      t.integer :expected_time
      t.integer :actual_time
      t.string :statement
      t.string :status

      t.timestamps
    end
  end
end
