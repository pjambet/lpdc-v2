module Refinery
  module Distributors
    module Admin
      class DistributorsController < ::Refinery::AdminController

        crudify :'refinery/distributors/distributor',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
