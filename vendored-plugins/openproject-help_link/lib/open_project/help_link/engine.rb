#-- copyright
# OpenProject Help Link Plugin
#
# Copyright (C) 2011 - 2014 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# version 3.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#++

require 'open_project/plugins'

require 'rails/engine'

module OpenProject::HelpLink
  class Engine < ::Rails::Engine
    engine_name :openproject_help_link

    def self.settings
      {
        default: {
          'help_link_target' => 'https://www.openproject.org/help'
        },
        partial: 'settings/openproject_help_link_settings.html.erb'
      }
    end

    include OpenProject::Plugins::ActsAsOpEngine

    register 'openproject-help_link',
             author_url: 'http://finn.de',
             requires_openproject: '>= 4.0.0',
             settings: settings do
    end

    config.to_prepare do
      require_dependency 'open_project/help_link/patches/info_patch'
    end
  end
end
