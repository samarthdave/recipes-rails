Rails.application.routes.draw do

  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "signup" }

  root 'welcome#index'
  
  resources :recipes, except: [:show, :new, :edit]
  
  get 'new/recipe', to: 'recipes#new', as: 'new_recipe'
  
  get 'edit/recipe/:id', to: 'recipes#edit', as: 'edit_recipe'
  
  get 'recipe/:id', to: 'recipes#show', as: 'show_recipe'
  
end