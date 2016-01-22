module Announcements
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_account_login_bottom, :partial => "announcements/show"
  end
end
