Refinery::Application.routes.draw do
  resources :banners, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :banners, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
