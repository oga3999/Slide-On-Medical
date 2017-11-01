class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.text :slide_url
      t.text :author_comment
      t.text :slide
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
