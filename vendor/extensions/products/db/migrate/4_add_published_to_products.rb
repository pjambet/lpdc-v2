class AddPublishedToProducts < ActiveRecord::Migration

  def change
    add_column :refinery_products, :published, :boolean
  end

end

