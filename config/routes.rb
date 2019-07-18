Rails.application.routes.draw do
  get 'demo/index'
  get 'demo/clock'
  get 'demo/supreme'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'demo#index'
end
