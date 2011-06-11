Refinery::Application.routes.draw do
  resources :eventos, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :eventos, :except => :show do
      collection do
        post :update_positions
        get :autocomplete_tag_name
      end
    end
  end
end
