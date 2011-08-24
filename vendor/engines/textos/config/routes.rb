Refinery::Application.routes.draw do
  resources :textos, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :textos, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
