Rails.application.routes.draw do
  resources :crawling_products
  controller :products do
    get 'products', to: :products
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #
  # root :to => 'welcome#index'

  resources :welcome
end
