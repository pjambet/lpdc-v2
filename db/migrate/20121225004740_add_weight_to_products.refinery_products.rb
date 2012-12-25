# This migration comes from refinery_products (originally 2)
class AddWeightToProducts < ActiveRecord::Migration

  def change
    add_column :refinery_products, :weight, :float
  end

end

