class AddArchivedToErpDistributorsDistributors < ActiveRecord::Migration[5.1]
  def change
    add_column :erp_distributors_distributors, :archived, :boolean, default: false
  end
end
