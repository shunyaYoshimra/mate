class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :content
      t.string :address
      t.float :latitude
      t.float :longitude
      t.datetime :date
      t.boolean :paid
      t.string :price
      t.string :integer

      t.timestamps
    end
  end
end
