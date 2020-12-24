Erp::Areas::District.class_eval do
    has_many :distributors, class_name: 'Erp::Distributors::Distributor'
end