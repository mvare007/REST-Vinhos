class RemoveServTempFromWines < ActiveRecord::Migration[6.0]
  def change
    remove_column :wines, :serv_temp, :string
  end
end
