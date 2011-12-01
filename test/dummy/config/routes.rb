Rails.application.routes.draw do

  mount LogPile::Engine => "/logs"
end
