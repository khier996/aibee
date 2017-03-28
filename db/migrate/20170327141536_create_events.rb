class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :hobby, foreign_key: true
      t.integer :price
      t.date :start_time
      t.date :end_time
      t.integer :min_pax
      t.integer :max_pax

      t.timestamps
    end
  end
end
