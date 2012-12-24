# This migration comes from refinery_news_items (originally 2)
class AddPublishedToNewsItems < ActiveRecord::Migration

  def change
    add_column :refinery_news_items, :published, :boolean
  end

end

