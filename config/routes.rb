Erp::Distributors::Engine.routes.draw do
    scope "(:locale)", locale: /en|vi/ do
		namespace :backend, module: "backend", path: "backend/distributors" do
            resources :distributors do
                collection do
                    post 'list'
                    get 'dataselect'
                    delete 'delete_all'
                    put 'archive_all'
                    put 'unarchive_all'
                    put 'archive'
                    put 'unarchive'
                end
            end
        end
    end
end