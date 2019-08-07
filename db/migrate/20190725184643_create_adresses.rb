class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      t.string :street
      t.string :number
      t.string :neighborhood
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
