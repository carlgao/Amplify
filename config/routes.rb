Linword::Application.routes.draw do

  #resources :songs

  resources :requests do
    collection do
      get :request_song
      post :post_request
      post :vote
    end
  end

  resources :songs do
    collection do
      #get :send_request
      #post :post_request
      get :now_playing
      post :vote
      get :dj
      post :play
      post :not_play
      post :hotness
      get :destroy_all
      get :get_hotness
      get :get_name
    end
  end

  get "pages/home"
  #root :to => "pages#home"
  get "pages/song_request"
  #root :to => "songs#now_playing"
  root :to => "pages/event_list"
  get "pages/get_word"
  get "pages/gallery1"
  get "pages/send_request"
  get "pages/accel"
  get "pages/meter"
  get "pages/event_list"
  get "pages/look"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
