Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'admin/dashboard#index'

  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :songs, only: %i[show index]
    resources :playlists, only: %i[show index]
  end
end
