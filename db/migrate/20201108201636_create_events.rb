class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :date
      t.text :address 
      t.string :image
      t.integer :user_id
    end

  end
end
