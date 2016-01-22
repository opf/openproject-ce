# OpenProject Local Avatars plugin
#
# Copyright (C) 2010  Andrew Chaika, Luca Pireddu
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

module OpenProject::LocalAvatars
  module Patches
    module MyControllerPatch
      def self.included(base) # :nodoc:
        base.class_eval do
          helper :attachments
          verify :method => :get, :only => :avatar, :render => {:nothing => true, :status => :method_not_allowed}
          verify :method => :post, :only => :my_update_avatar, :render => {:nothing => true, :status => :method_not_allowed}
          menu_item :change_avatar, :only => [:avatar]

          include AttachmentsHelper
          include ::OpenProject::LocalAvatars::LocalAvatars
          include InstanceMethods
        end
      end

      module InstanceMethods
        def avatar
          @user = User.current
          write_settings(redirect_to: :avatar)
        end

        def update_avatar
          @user = User.current

          save_or_delete_avatar
          redirect_to action: 'avatar'
        end
      end
    end
  end
end
