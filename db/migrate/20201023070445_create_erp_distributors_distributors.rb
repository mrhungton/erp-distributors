class CreateErpDistributorsDistributors < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_distributors_distributors do |t|
      t.string :name
      t.string :address
      t.string :image
      t.string :open_time
      t.decimal :latitude
      t.decimal :longitude
      t.references :country, index: true, references: :erp_areas_countries
      t.references :state, index: true, references: :erp_areas_states
      t.references :district, index: true, references: :erp_areas_districts
      t.references :creator, index: true, references: :erp_users

      t.timestamps
    end
  end
end
