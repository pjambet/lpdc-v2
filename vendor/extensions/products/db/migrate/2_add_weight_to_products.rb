class AddWeightToProducts < ActiveRecord::Migration

  def change
    add_column :refinery_products, :weight, :float
  end

end

