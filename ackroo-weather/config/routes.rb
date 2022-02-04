Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :weathers do
    collection do
      get 'latest'
    end
  end

  root to: 'weathers#latest'
end
