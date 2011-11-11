LogEngine::Engine.routes.draw do
  resources :logfiles
  
  match '/:permalink/messages' => 'logfiles#messages'
  match '/:permalink' => 'logfiles#show', :as => 'permalink'

  root :to => 'logfiles#index'
end
