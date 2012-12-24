module Refinery
  module GoldBooks
    module Admin
      class GoldBooksController < ::Refinery::AdminController

        crudify :'refinery/gold_books/gold_book',
                :title_attribute => 'author', :xhr_paging => true

      end
    end
  end
end
