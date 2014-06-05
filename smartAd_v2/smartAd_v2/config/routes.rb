Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => "sessions", :registrations => "users" } 
  devise_scope :user do
    get 'bidder/sign_in' => 'sessions#new'
  end
  
  get 'products/:id/graph' => 'products#product_graph'
  get 'products/:id/calendar' => 'products#product_calendar'
  
  get 'products/product_type' => 'products#product_type'
  get 'products/product_option' => 'products#product_option'
  get 'products/format' => 'products#format'
  get 'products/form_factor' => 'products#form_factor'
  get 'products/grade' => 'products#grade'
  get 'products/period' => 'products#period'
  get 'products/time_share' => 'products#time_share'
  
  resources :users
  resources :user_types
  resources :products 
  
  resources :auctions
  
  
  get 'reports/product-sales' => 'products#sales'
  get 'reports/view-counts' => 'products#view_counts'
  
  
  get 'post-ad/:id' => 'portal#post_ad'
  
  namespace :bidder do
    root 'portal#index'
    get 'my-bids' => 'portal#my_bids', as: :my_bids
    post 'create_bids/:id' => 'bids#create_bids'   
    post 'upload_bids_image/:auction_id' => 'bids#upload_bids_image'
  end
  
  get 'webservices/auction-list' => 'webservices#get_auction_list'

  
  root 'portal#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
