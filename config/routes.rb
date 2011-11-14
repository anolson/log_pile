LogEngine::Engine.routes.draw do
  resources :logfiles
  
  match '/:permalink/poll' => 'logfiles#poll', :as => 'poll'
  match '/:permalink' => 'logfiles#show', :as => 'permalink'

  root :to => 'logfiles#index'
end
