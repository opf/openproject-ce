module OpenProject
  module Announcements
    # Merged into OpenProject core
    # with https://github.com/opf/openproject/pull/4368
    ActiveSupport::Deprecation.warn <<-DEPRECATION_NOTE.strip_heredoc
      OpenProject-announcements has been fully integrated into OpenProject 5.1.
      Please remove this plugin from your Gemfile.plugin entries.
    DEPRECATION_NOTE
  end
end
