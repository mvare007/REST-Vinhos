class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :variant
      t.string :country
      t.string :region
      t.float :volume
      t.string :maker

      t.timestamps
    end
  end
end
