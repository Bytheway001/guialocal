class CreatePromos < ActiveRecord::Migration[5.0]
  def change
    create_table :promos, id: :uuid  do |t|
      t.string :titulo
      t.string :texto
      t.string :imgpromo
      t.datetime :validez
      t.references :empresa, foreign_key: true

      t.timestamps
    end
  end
end
