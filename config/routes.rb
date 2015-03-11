Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  post "upload" => "photos#add_ava"

  root 'pages#index'

  get "sign_out" => "sessions#destroy", as: "sign_out"
  get "sign_in"  => "sessions#new",     as: "sign_in"
  post "sign_in" => "sessions#create"   
  get "sign_up"  => "users#new",        as: "sign_up" 
  post "sign_up" => "users#create"


  get 'friends'  => 'friends#index'
  get 'friends/:user_id'  => 'friends#show', as: :user_friend 
  get 'add_friend/:user_id'  => 'friends#add', as: :add_friend
  post 'delete_friend/:user_id'  => 'friends#destroy', as: :delete_friend


  get 'messages' => 'pages#messages'
  get 'settings' => 'pages#settings'

  get ':user_id/photos',   to: 'photos#albums',   as: :user_photos
  get 'photos/:user_id/:album_id',   to: 'photos#show',   as: :user_album_photos
  post 'delete_photo/:photo_id',   to: 'photos#destroy',   as: :delete_photo
  post 'delete_album/:album_id',   to: 'photos#destroy_album',   as: :delete_album


  get ':user_id/message', to: 'pages#message',  as: :user_message

  post "post" => "posts#create"   
  post "post_delete/:post_id" => "posts#destroy", as: :post_delete

  post "comment"        => "comments#create"   
  post "comment_delete/:comment_id" => "comments#destroy", as: :comment_delete

  patch 'settings' => 'settings#update'
  patch 'url_change' => 'settings#update_url'
  patch 'password_change' => 'settings#update_password'

  get ':user_id', to: 'pages#index', as: :user


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
