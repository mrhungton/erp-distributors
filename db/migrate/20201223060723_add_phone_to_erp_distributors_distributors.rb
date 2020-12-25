class AddPhoneToErpDistributorsDistributors < ActiveRecord::Migration[5.1]
  def change
    add_column :erp_distributors_distributors, :phone, :string
  end
end
