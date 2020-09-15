class CreateLives < ActiveRecord::Migration[5.2]
  def change
    create_table :lives do |t|

      t.references :user, null:false, foreign_key: true
      t.integer :study_time,  null:false, default: 0
      t.integer :sleeping_time, null:false, default: 0
      t.integer :exercise_time, null:false, default: 0
      t.string :study_memo
      t.string :sleeping_memo
      t.string :exercise_memo

      t.timestamps
    end
  end
end
