class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|

      t.references :user,       null:false, foreign_key: true
      t.references :genre,      null:false, foreign_key: true
      t.string :title,          null:false
      t.text :body,             null:false
      t.date :diary_date,       null:false
      t.integer :adequacy,      null:false

      t.timestamps
    end
  end
end
