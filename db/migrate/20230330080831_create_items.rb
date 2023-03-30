class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.decimal :price
      t.string :mentor_name
      t.text :duration

      t.timestamps
    end
  end
end
