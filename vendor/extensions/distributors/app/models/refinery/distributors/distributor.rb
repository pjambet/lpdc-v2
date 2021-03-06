module Refinery
  module Distributors
    class Distributor < Refinery::Core::BaseModel
      self.table_name = 'refinery_distributors'

      attr_accessible :distributor_type, :name, :website, :address, :position

      acts_as_indexed fields: [:distributor_type, :name, :website, :address]

    end
  end
end
