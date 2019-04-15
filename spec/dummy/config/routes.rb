Rails.application.routes.draw do
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
  end

  get '', to: "dummy#root"

  resources :url_helper, only: [] do
    get :an_action, on: :collection
    get :another_action, on: :collection
  end
end
