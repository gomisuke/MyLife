class CreateCustoms < ActiveRecord::Migration[5.2]
  def change
    create_table :customs do |t|
      t.string :task,          null: false
      t.references :user,      null: false, foreign_key: true


      t.timestamps
    end
  end
end
