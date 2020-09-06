class CreateCustomRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_records do |t|
      t.references :custom,      null: false, foreign_key: true
      t.datetime :start_time,    null: false

      t.timestamps
    end
  end
end
