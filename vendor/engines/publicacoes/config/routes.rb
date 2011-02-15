Refinery::Application.routes.draw do

  match 'artigos', :to => 'artigos#index', :as => 'publicacoes_root'
  match 'feed.rss', :to => 'artigos#index.rss', :as => 'artigos_rss_feed'
  match 'artigo/:id', :to => 'artigos#show', :as => 'artigo'
  match 'categorias/:id', :to => 'categorias#show', :as => 'categoria'

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do

    resources :artigos
    resources :categorias

  end

end
