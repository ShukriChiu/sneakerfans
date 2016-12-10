class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :techs, array: true
      t.string :picture
      t.string :address
      t.timestamps
    end
  end
end
