class AddSlugToProducts < ActiveRecord::Migration

  def change
    add_column :refinery_products, :slug, :string
  end

end

