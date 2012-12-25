# This migration comes from refinery_distributors (originally 3)
class ChangeTypeToString < ActiveRecord::Migration

  def change
    change_column :refinery_distributors, :distributor_type, :string
  end
end


