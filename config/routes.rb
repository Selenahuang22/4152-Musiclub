Musiclub::Application.routes.draw do

  resources :musics
  # map '/' to be a redirect to '/musics'
  root :to => redirect('/musics')
  get 'login' => 'accounts#login'
  post 'create_login' => 'accounts#create_login'
  delete 'logout' => "accounts#logout"

end
