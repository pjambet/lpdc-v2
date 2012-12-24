class CreateGoldBooksGoldBooks < ActiveRecord::Migration

  def up
    create_table :refinery_gold_books do |t|
      t.text :content
      t.string :author
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-gold_books"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/gold_books/gold_books"})
    end

    drop_table :refinery_gold_books

  end

end
