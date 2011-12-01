LogPile::Engine.routes.draw do
  resources :logfiles, :only => [:index, :show] do
    get 'poll', :on => :collection
  end
  
  # match '/:permalink/poll' => 'logfiles#poll', :as => 'poll'
  # match '/:permalink' => 'logfiles#show', :as => 'permalink'

  root :to => 'logfiles#index'
end
