require 'open_project/themes/theme'

module OpenProject::Themes::Dark
  class DarkTheme < OpenProject::Themes::Theme
    def assets_path
      OpenProject::Themes::Dark.assets_path
    end
  end
end
