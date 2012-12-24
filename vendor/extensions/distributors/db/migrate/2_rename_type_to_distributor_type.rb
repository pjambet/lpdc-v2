class RenameTypeToDistributorType < ActiveRecord::Migration

  def change
    rename_column :refinery_distributors, :type, :distributor_type
  end
end

