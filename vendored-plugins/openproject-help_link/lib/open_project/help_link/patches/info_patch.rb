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

module OpenProject::HelpLink
  module Patches
    module InfoPatch
      def self.included(base)
        base.send(:extend, ClassMethods)

        base.class_eval do

          class << self
            alias_method_chain :help_url, :settings
          end
        end
      end

      module ClassMethods
        def help_url_with_settings
          Setting.plugin_openproject_help_link['help_link_target']
        end
      end
    end
  end
end

OpenProject::Info.send(:include, OpenProject::HelpLink::Patches::InfoPatch)
