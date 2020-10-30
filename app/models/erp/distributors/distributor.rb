module Erp::Distributors
  class Distributor < ApplicationRecord

    belongs_to :creator, class_name: 'Erp::User'
    mount_uploader :image, Erp::Distributors::DistributorImageUploader

    validates :name, :address, :open_time, :latitude, :longitude, presence: true
    validates :name, uniqueness: true

    validates :image, presence: true
    validates :image, allow_blank: true, format: {
			with: %r{\.(gif|jpg|png)\Z}i,
			message: 'URL hình ảnh phải có định dạng: GIF, JPG hoặc PNG.'
		}

  end
end
