Rails.application.routes.draw do

  mount LogEngine::Engine => "/logs"
end
