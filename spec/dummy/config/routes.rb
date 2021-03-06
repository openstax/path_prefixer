Rails.application.routes.draw do

  mount AnEngine::Engine, at: '/'

  scope controller: :dummy do
    get :an_action
    get :local_redirect_via_action
    get :local_redirect_via_path_string
    get :local_redirect_via_full_url
    get :local_redirect_via_path_helper
    get :local_redirect_via_proc
    get :external_redirect
    get :a_prefix_blah
    get :a_prefix_blah_redirect
    get :hostless_non_accounts_redirect
  end

  get '', to: "dummy#root"

  match 'books/physics', to: "dummy#root", via: [:options]

  resources :url_helper, only: [] do
    get :an_action, on: :collection
    get :another_action, on: :collection
  end
end
