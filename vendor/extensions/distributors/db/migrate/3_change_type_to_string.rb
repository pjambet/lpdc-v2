class ChangeTypeToString < ActiveRecord::Migration

  def change
    change_column :refinery_distributors, :distributor_type, :string
  end
end


