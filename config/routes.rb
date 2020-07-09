Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: "users/confirmations",
    sessions: 'users/sessions',
    # omniauth_callbacks: 'users/omniauth_callbacks',
    passwords: 'users/passwords',
}
  resources :users, except: [:show, :create] do
    collection do
      get 'import-users-from-excel', to: 'users#import_users_from_excel'
      post 'import_users_from_excel_execute', to: 'users#import_users_from_excel_execute'
      get 'download-users-file-template' => 'users#download_users_file_template', as: 'download_users_file_template'
    end
  end

end
