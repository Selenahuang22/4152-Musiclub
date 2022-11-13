Musiclub::Application.routes.draw do
  resources :users
  resources :musics
  # map '/' to be a redirect to '/musics'
  root :to => redirect('/musics')
end
