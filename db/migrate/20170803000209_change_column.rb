class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
  	change_column :sprints, :start_date, :date
  	change_column :sprints, :end_date, :date
  end
end
