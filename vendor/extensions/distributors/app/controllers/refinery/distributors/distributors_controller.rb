module Refinery
  module Distributors
    class DistributorsController < ::ApplicationController

      before_filter :find_all_distributors
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @distributor in the line below:
        present(@page)
      end

      def show
        @distributor = Distributor.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @distributor in the line below:
        present(@page)
      end

    protected

      def find_all_distributors
        @distributors = Distributor.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/distributeurs").first
      end

    end
  end
end
