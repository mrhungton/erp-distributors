module Erp::Distributors
  class Distributor < ApplicationRecord

    belongs_to :creator, class_name: 'Erp::User'
    mount_uploader :image, Erp::Distributors::DistributorImageUploader

    validates :image, :address, :open_time, :latitude, :longitude, presence: true
    validates :name, uniqueness: true, presence: true

    validates :image, allow_blank: true, format: {
			with: %r{\.(gif|jpg|png)\Z}i,
			message: 'URL hình ảnh phải có định dạng: GIF, JPG hoặc PNG.'
		}

    def archive
			update_columns(archived: true)
		end

		def unarchive
			update_columns(archived: false)
		end

    def self.archive_all
			update_all(archived: true)
		end

    def self.unarchive_all
			update_all(archived: false)
    end
    
    def self.get_active
			self.where(archived: false)
    end
    
  end
end
