Rails.application.routes.draw do

  root 'bolsa_de_emprego#home'
  get 'frontoffice/home', to: 'bolsa_de_emprego#home'

  get 'frontoffice/entidades', to: 'bolsa_de_emprego#entidades'
  get 'frontoffice/candidatos', to: 'bolsa_de_emprego#candidatos'
  get 'frontoffice/ofertas', to: 'bolsa_de_emprego#ofertas'
  get 'frontoffice/noticias', to: 'bolsa_de_emprego#noticias'

  get 'frontoffice/registo',  to: 'utilizadores#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
