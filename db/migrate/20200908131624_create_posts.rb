class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.references :user,        null:false, foreign_key: true
      t.string :content
      t.string :post_image_id
      t.boolean :post_status,    null:false, default: true


      t.timestamps
    end
  end
end
