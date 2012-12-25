module Refinery
  module GoldBooks
    class GoldBooksController < ::ApplicationController

      before_filter :find_all_gold_books
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @gold_book in the line below:
        present(@page)
      end

      def create
        @gold_book = GoldBook.new params[:gold_book]
        @gold_book.save
        render :index
      end

      def show
        @gold_book = GoldBook.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @gold_book in the line below:
        present(@page)
      end

    protected

      def find_all_gold_books
        @gold_books = GoldBook.order('created_at DESC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/livre_dor").first
      end

    end
  end
end
