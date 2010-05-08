ActionController::Routing::Routes.draw do |map|
  map.resource :sessions, :collection => {:unauthenticated => :get}
  map.resource :account
  map.resources :rubyists

  map.resources :registrations
  map.resources :carts, :collection => {
    :add_item => :post, :remove_item => :delete
  }
  map.resources :orders, :collection => {
    :confirm => :get, :thanks => :get
  }
  map.paypal_ipn "/paypal/instant_payment_notification",
    :controller => 'paypal', :action => 'instant_payment_notification'
  map.dashboard("/dashboard",
    :controller => 'dashboard', :action => 'index')

  map.with_options( :controller => "public_releases", :action => "show",
                    :defaults => {:page_name => "index"} ) do |pr|
    pr.pub_release ":year/:locale/:page_name", :requirements => {:year => /2\d{3}/, :locale => /en|ja/ }
    pr.pub_release ":year/:locale/:page_name.:format", :requirements => {:year => /2\d{3}/, :locale => /en|ja/ }
    pr.connect     ":year/:page_name", :requirements => {:year => /2\d{3}/}
  end

  map.root :controller => 'welcome'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
