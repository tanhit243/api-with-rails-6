Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    namespace :v1 do
      devise_for :users,
                 controllers: {
                   sessions: 'users/sessions'
                 },
                 only: :sessions,
                 path_names: { sign_in: :login, sign_out: :logout }

      resources :users, only: %i[show index]
    end
  end
end
