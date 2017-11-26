class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :slide, foreign_key: true, null: false
      t.timestamps
    end
  end
end
