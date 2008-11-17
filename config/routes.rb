ActionController::Routing::Routes.draw do |map|

 # For RESTful_Authentication
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users  
  map.resource :session

  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil 

  # For RESTful_ACL
  map.error '/error', :controller => 'sessions', :action => 'error'
  map.denied '/denied', :controller => 'sessions', :action => 'denied'


  map.resources :games,		 :has_many => [ :videos ]
  map.resources	:categories, :has_many => [ :games ]
  map.resources :videos
  map.root		:controller => "games"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
end
