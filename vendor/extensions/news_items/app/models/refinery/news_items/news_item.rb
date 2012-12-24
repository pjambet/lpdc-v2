module Refinery
  module NewsItems
    class NewsItem < Refinery::Core::BaseModel
      self.table_name = 'refinery_news_items'

      attr_accessible :content, :title, :position, :published

      acts_as_indexed :fields => [:content, :title]

      validates :content, :presence => true, :uniqueness => true

      scope :published, -> do
        where('published = true')
      end
    end
  end
end
