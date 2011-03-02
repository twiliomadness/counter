Counter::Application.routes.draw do

  resources :events, :only => [:create] do
  end

  devise_for :users

  root :to => "pages#home"
end
