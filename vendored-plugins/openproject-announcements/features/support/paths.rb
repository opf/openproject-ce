module AnnoucementNavigationHelpers
  def path_to(page_name)
    case page_name
    when /the edit page of Announcement/
      '/admin/announcement/edit'
    else
      super
    end
  end
end

World(AnnoucementNavigationHelpers)
