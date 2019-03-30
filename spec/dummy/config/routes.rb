Rails.application.routes.draw do
  scope controller: :dummy do
    get :an_action
  end
end
