class CreateDistributorsDistributors < ActiveRecord::Migration

  def up
    create_table :refinery_distributors do |t|
      t.text :type
      t.string :name
      t.string :website
      t.string :address
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-distributors"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/distributors/distributors"})
    end

    drop_table :refinery_distributors

  end

end
