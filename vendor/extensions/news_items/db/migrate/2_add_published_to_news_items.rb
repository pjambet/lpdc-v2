class AddPublishedToNewsItems < ActiveRecord::Migration

  def change
    add_column :refinery_news_items, :published, :boolean
  end

end

