Rails.application.routes.draw do

  root   'frontoffice#home'

  resources :frontoffice, only:[:index_noticias, :show_noticia, :new, :home] do
    collection do
      get 'noticias', to: 'frontoffice#index_noticias'
      get 'noticia/:id', to: 'frontoffice#show_noticia', as: 'noticia'
    end
  end

  scope 'frontoffice/' do
    get    'home', to: 'frontoffice#home'

    get    'registo',  to: 'frontoffice#new'
    get    'registo/entidade', to: 'entidades#new'
    get    'registo/candidato', to: 'candidatos#new'

    get    'login',   to: 'sessions#new'
    post   'login',   to: 'sessions#create'
    delete 'logout',  to: 'sessions#destroy'

    #get    'oferta',  to: 'ofertas#new'

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

    resources :candidaturas,       only: [:create]

  end

  scope 'backoffice/' do
    get    'login',    to: 'sessions#new'
    get    'home',     to: 'backoffice#home', as: 'backhome'

    resources :contas, path: 'utilizadores' do
      collection do
        get   'alterarpassword/:id', to: 'contas#edit_password' ,as: 'alterarpassword'
        put   'alterarpassword/:id', to: 'contas#update_password'
      end
    end

    resources :noticias
  end






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
