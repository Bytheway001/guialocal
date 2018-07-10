Rails.application.routes.draw do

  root 'empresas#home'
  get '/empresas_ordenadas', to: 'empresas#empresas_ordenadas'
  get '/empresas/:id/horarios', to: 'empresas#horarios'
  get '/historia', to: 'info#historia'
  get '/turismo', to: 'info#turismo'
  get '/turismoactivo', to: 'info#turismoactivo'
  get '/alojamiento', to: 'info#alojamiento'
  get '/gastronomia', to: 'info#gastronomia'
  get '/naturaleza', to: 'info#naturaleza'
  get '/ocio', to: 'info#ocio'
  get '/guiaturistico', to: 'info#guiaturistico'
  get '/publica', to: 'info#publica'
  get '/publicitate', to: 'info#publicitate'
  get '/precios', to: 'info#precios'
  get '/consiguemascreditos', to: 'info#consiguemascreditos'
  get '/mispromos', to: 'promos#mispromos'
  get '/mapadeltesoro/:id', to: 'puntos#mapa'
  get '/gesteventos', to: 'eventos#editor_index'

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  resources :eventos
  resources :charges
  resources :puntos, only: [:show, :index]
  resources :incidents, only: [:new, :create, :show]
  resources :empresas
  resources :categories, only: [:index, :show]
  resources :tags, only: [:index, :show]
  resources :promos, only: [:show, :index, :new, :create]
  resources :achievement_proposals, only: :show

  namespace :superadmin do
    root 'application#index'
    get 'configs', to: 'config#edit'
    patch 'configs', to: 'config#update'
    post '/creditos/update', to: 'creditos#update'
    get '/creditos/edit', to: 'creditos#edit'
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :empresas
    resources :promos, only: [:index, :edit, :update, :destroy]
    resources :eventos, except: [:show]
    resources :destacados
    resources :puntos
    resources :maps
    resources :achievement_proposals
    resources :categories, except: [:show]
    resources :tags, only: [:index, :show, :destroy]
    resources :incidents do
      resources :comments
    end
  end

  namespace :admin do
    root 'application#index'
    resources :users, only: [:show, :index, :edit, :update]
    resources :eventos, except: [:show]
    resources :tags, only: [:index, :show, :destroy]
    resources :promos, only: [:index, :edit, :update, :destroy]
    resources :incidents do
      resources :comments
    end
    resources :empresas
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
  end

end
