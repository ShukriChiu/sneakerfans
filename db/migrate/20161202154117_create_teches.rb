class CreateTeches < ActiveRecord::Migration[5.0]
  def change
    create_table :teches do |t|
      t.string :tech_name
      t.belongs_to :brand
      t.timestamps
    end
  end
end
