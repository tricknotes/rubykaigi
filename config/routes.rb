ActionController::Routing::Routes.draw do |map|
  map.with_options( :controller => "public_releases", :action => "show",
                    :defaults => {:page_name => "index"} ) do |pr|
    pr.pub_release ":year/:locale/:page_name", :requirements => {:year => /2\d{3}/, :locale => /en|ja/ }
    pr.connect     ":year/:page_name", :requirements => {:year => /2\d{3}/}
 end

  map.resources :rubyists, :only => %w(show)

  map.root :controller => 'welcome'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
