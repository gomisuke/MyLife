class CreateCustoms < ActiveRecord::Migration[5.2]
  def change
    create_table :customs do |t|
      t.string :task,           null: false
      t.references :user,       null: false, foreign_key: true
      t.integer :task_status,	null: false, default: 0


      t.timestamps
    end
  end
end
