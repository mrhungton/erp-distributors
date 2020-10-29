Erp::Distributors::Engine.routes.draw do
    scope "(:locale)", locale: /en|vi/ do
		namespace :backend, module: "backend", path: "backend/distributors" do
            resources :distributors do
                collection do
                    post 'list'

                end
            end
        end
    end
end