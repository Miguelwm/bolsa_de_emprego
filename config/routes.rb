Rails.application.routes.draw do

  root   'frontoffice#home'
  get    'frontoffice/home', to: 'frontoffice#home'

  get    'frontoffice/registo',  to: 'frontoffice#new'
  get    'frontoffice/registo/entidade', to: 'entidades#new'
  get    'frontoffice/registo/candidato', to: 'candidatos#new'

  get    'frontoffice/login',   to: 'sessions#new'
  post   'frontoffice/login',   to: 'sessions#create'
  delete 'frontoffice/logout',  to: 'sessions#destroy'

  get    'frontoffice/oferta',  to: 'ofertas#new'

  get    'backoffice/login',    to: 'sessions#new'
  get    'backoffice/home',     to: 'backoffice#home'

  get    'backoffice/noticia',  to: 'noticias#new'

  resources :entidades
  resources :candidatos
  resources :ofertas
  resources :noticias

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
