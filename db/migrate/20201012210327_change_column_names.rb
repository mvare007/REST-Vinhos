class ChangeColumnNames < ActiveRecord::Migration[6.0]
  change_table :wines do |t|
    t.rename :grade, :volume
    t.rename :origin, :country
  end
end
