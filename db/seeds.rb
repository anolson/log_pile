LogPile::Logfile.create(
  :name => "Rails application log", 
  :path => Rails.application.config.paths["log"].first, 
  :permalink => "rails")