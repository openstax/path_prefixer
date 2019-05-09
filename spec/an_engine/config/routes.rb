AnEngine::Engine.routes.draw do
  match "/*all" => 'application#options',  via: [:options]
end
