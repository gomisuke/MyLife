class CreateLifeRecodes < ActiveRecord::Migration[5.2]
  def change
    create_table :life_recodes do |t|

      t.references :user, null:false, foreign_key: true
      t.integer :study_time,  null:false
      t.integer :sleeping_time, null:false
      t.integer :exercise_time, null:false
      t.string :study_memo
      t.string :sleeping_memo
      t.string :exercise_memo

      t.timestamps
    end
  end
end
