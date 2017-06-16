Rails.application.routes.draw do

  # get 'password_resets/new'
  #
  # get 'password_resets/edit'

  root   'frontoffice#home'

  resources :frontoffice, only:[:index_noticias, :show_noticia, :new, :home] do
    collection do
      get 'noticias', to: 'frontoffice#index_noticias'
      get 'noticia/:id', to: 'frontoffice#show_noticia', as: 'noticia'
    end
  end

    get 'frontoffice', to: 'frontoffice#front'

  scope 'frontoffice/' do
    get    'home', to: 'frontoffice#home'

    get    'registo',  to: 'frontoffice#new'
    get    'registo/entidade', to: 'entidades#new'
    get    'registo/candidato', to: 'candidatos#new'

    get    'login',   to: 'sessions#new'
    post   'login',   to: 'sessions#create'
    delete 'logout',  to: 'sessions#destroy'
    get    'detalhes', to: 'detalhes#home'
    get    'alterarpassword', to: 'contas#edit_password_front'

    resources :account_activationns, only: [:edit]
    resources :password_resets,      only: [:new, :create, :edit, :update]

    scope 'detalhes' do
    resources :alterar_password,     only: [:edit, :update]
    get 'candidaturas', to: 'detalhes#showcandidaturas', as: 'candidaturascandidato'
    get 'interessadas', to: 'detalhes#showinteressadas'
    get 'ofertas', to: 'detalhes#showofertasativas', as: 'ofertasativas'
    get 'historico', to: 'detalhes#showhistorico'
    get 'interessados', to: 'detalhes#showinteressados'
    end

    resources :entidades
    resources :ofertas do
      member do
        get :candidato
      end
    end


    resources :candidatos do
      member do
        get :oferta
      end
    end

    resources :candidaturas,     only: [:create]
    resources :interesses,       only: [:create, :destroy]

  end

  scope 'backoffice/' do
    get    'login',    to: 'sessions#new'
    get    'home',     to: 'backoffice#home', as: 'backhome'

    resources :contas, path: 'utilizadores' do
      collection do
        get   'alterarpassword/:id', to: 'contas#edit_password' ,as: 'alterarpassword'
        patch  'alterarpassword/:id', to: 'contas#update_password'

      end
    end


    resources :noticias
  end






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
