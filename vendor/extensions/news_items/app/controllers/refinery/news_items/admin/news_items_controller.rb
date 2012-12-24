module Refinery
  module NewsItems
    module Admin
      class NewsItemsController < ::Refinery::AdminController

        crudify :'refinery/news_items/news_item', :xhr_paging => true

      end
    end
  end
end
