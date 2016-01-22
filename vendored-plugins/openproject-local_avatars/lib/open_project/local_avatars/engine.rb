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
  class Engine < ::Rails::Engine
    engine_name :openproject_local_avatars

    include OpenProject::Plugins::ActsAsOpEngine

    register 'openproject-local_avatars',
             :author_url => 'http://finn.de',
             :requires_openproject => '>= 4.0.0' do

      add_menu_item :my_menu, :change_avatar,
              {:controller => 'my', :action => 'avatar'},
              :caption => :button_change_avatar,
              :html => { :class => 'icon2 icon-image1' }
     end

    config.to_prepare do
      require_dependency 'project'
    end

    patches [:User,
             :AvatarHelper,
             :MyController,
             :UsersController,
             :UsersHelper]
  end
end
