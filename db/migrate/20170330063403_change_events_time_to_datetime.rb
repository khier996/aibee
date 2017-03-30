class ChangeEventsTimeToDatetime < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :start_time, :date
    remove_column :events, :end_time, :date
    add_column :events, :start_time, :datetime
    add_column :events, :end_time, :datetime
  end
end
