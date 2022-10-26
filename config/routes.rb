Musiclub::Application.routes.draw do
  resources :musics
  # map '/' to be a redirect to '/musics'
  root :to => redirect('/musics')
end
