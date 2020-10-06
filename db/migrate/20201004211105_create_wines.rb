class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :variant
      t.string :origin
      t.string :region
      t.float :grade
      t.string :maker
      t.string :serv_temp

      t.timestamps
    end
  end
end
