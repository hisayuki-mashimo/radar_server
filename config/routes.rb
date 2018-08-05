Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/api/user', to: 'api#get_user'
  get '/admin/user', to: 'admin#user_list'
end
