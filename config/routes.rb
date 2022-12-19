Musiclub::Application.routes.draw do

  resources :musics
  # map '/' to be a redirect to '/musics'
  root :to => redirect('/login')
  get 'login' => 'accounts#login'
  post 'create_login' => 'accounts#create_login'
  delete 'logout' => "accounts#logout"
  get 'signup' => 'accounts#signup'
  post 'create_account' => 'accounts#create_account'

  get 'music_search'=>'musics#search'
  get 'download_music' => 'musics#download'
  get 'download_remove_music' => 'musics#download_remove'
  get 'favorite_music' => 'musics#favorite'
  get 'favorite_remove_music' => 'musics#favorite_remove'

  get 'download_index' => 'library#index'
  get 'favorite_index' => 'favorite_cart#index'

  get 'payment' => 'musics#payment'

  get 'payment_index' => 'payment#index'
  post 'create_payment' => 'payment#create_payment'

  get 'comment_index' => 'comment#index'
  post 'add_comment' => 'comment#add_comment'

  get 'comment_manage' => 'comment#manage'
  get 'comment_destroy' => 'comment#destroy'
end
