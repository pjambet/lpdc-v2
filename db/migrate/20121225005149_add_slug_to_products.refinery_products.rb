# This migration comes from refinery_products (originally 3)
class AddSlugToProducts < ActiveRecord::Migration

  def change
    add_column :refinery_products, :slug, :string
  end

end

