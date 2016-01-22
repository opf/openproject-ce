module OpenProject
  module Themes
    module Dark
      require 'open_project/themes/dark/engine'

      def self.assets_path
        @assets_path ||= Engine.root.join('app/assets').to_s
      end
    end
  end
end
