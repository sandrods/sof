Refinery::Application.routes.draw do
  scope(:path => 'publicacoes', :module => 'publicacoes') do
    root :to => 'artigos#index', :as => 'publicacoes_root'
    match 'feed.rss', :to => 'artigos#index.rss', :as => 'publicacoes_rss_feed'
    match ':id', :to => 'artigos#show', :as => 'publicacoes_artigo'
    match 'categorias/:id', :to => 'categorias#show', :as => 'publicacoes_categoria'
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    scope(:path => 'publicacoes', :as => 'publicacoes', :module => 'publicacoes') do
      root :to => 'artigos#index'
      resources :artigos

      resources :categorias

    end
  end
end
