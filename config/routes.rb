Rails.application.routes.draw do

  root 'bolsa_de_emprego#home'
  get 'frontoffice/home', to: 'bolsa_de_emprego#home'

  get 'frontoffice/entidades', to: 'bolsa_de_emprego#entidades'
  get 'frontoffice/candidatos', to: 'bolsa_de_emprego#candidatos'
  get 'frontoffice/ofertas', to: 'bolsa_de_emprego#ofertas'
  get 'frontoffice/noticias', to: 'bolsa_de_emprego#noticias'

  get 'frontoffice/registo',  to: 'bolsa_de_emprego#new'
  get 'frontoffice/registo/entidade', to: 'entidades#new'
  get 'frontoffice/registo/candidato', to: 'candidatos#new'

  resources :entidades
  resources :candidatos

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
