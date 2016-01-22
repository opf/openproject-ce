OpenProject::Application.routes.draw do

  post 'my/avatar', :controller => 'my', :action => 'update_avatar', :as => 'my_update_avatar'

  get 'my/avatar', :controller => 'my', :action => 'avatar', :as => 'my_avatar'

  get 'users/:id/avatar', :controller => 'users', :action => 'dump_avatar', :as => 'users_dump_avatar'

  post 'users/:id/avatar', :controller => 'users', :action => 'update_avatar', :as => 'users_update_avatar'

end
