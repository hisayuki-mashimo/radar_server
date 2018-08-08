Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #namespace :api, { format: 'json' } do
  scope :api, { format: 'json' } do
    #resources :user
    get '/user/:user_id/:parameter_type_id', to: 'api#get_user'
    get '/parameter/:parameter_type_id', to: 'api#get_parameter'
  end

  #get '/api/user/:user_id/:parameter_type_id', to: 'api#get_user'
  get '/admin/user', to: 'admin#user_list'
end
