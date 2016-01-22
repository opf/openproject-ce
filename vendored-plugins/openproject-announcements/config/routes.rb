OpenProject::Application.routes.draw do
  resource :announcements, :path => '/admin/announcement', :only => [:edit, :update]
end
