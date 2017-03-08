Rails.application.routes.draw do

  root   'frontoffice#home'

  scope 'frontoffice/' do
    get    'home', to: 'frontoffice#home'

    get    'registo',  to: 'frontoffice#new'
    get    'registo/entidade', to: 'entidades#new'
    get    'registo/candidato', to: 'candidatos#new'

    get    'login',   to: 'sessions#new'
    post   'login',   to: 'sessions#create'
    delete 'logout',  to: 'sessions#destroy'

    get    'oferta',  to: 'ofertas#new'

  end

  scope 'backoffice/' do
    get    'login',    to: 'sessions#new'
    get    'home',     to: 'backoffice#home'
    get    'utilizadores', to: 'contas#index'
    get    'noticia',  to: 'noticias#new'
  end



  resources :entidades
  resources :candidatos
  resources :ofertas
  resources :noticias, only: [:index,:show]
  resources :contas, path: 'utilizadores'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
