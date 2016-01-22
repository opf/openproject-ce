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
    module AvatarHelperPatch
      def self.included(base) # :nodoc:
        base.class_eval do

          def avatar_with_local(user, options = {})
            local_avatar(user, options) || avatar_without_local(user, options)
          end

          def avatar_url_with_local(user, options = {})
            local_avatar_url(user) || avatar_url_without_local(user, options)
          end

          alias_method_chain :avatar, :local
          alias_method_chain :avatar_url, :local

          private

          def local_avatar_url(user)
            with_default_local_avatar_options(user, {}) do |_, _|
              users_dump_avatar_url(user)
            end
          end

          def local_avatar(user, options = {})
            with_default_local_avatar_options(user, options) do |_, opts|
              tag_options = merge_image_options(user, opts)

              image_url = users_dump_avatar_url(user)

              tag_options[:src] = image_url
              tag_options[:alt] = 'Avatar'

              tag 'img', tag_options, false, false
            end
          end

          def with_default_local_avatar_options(user, options, &block)
            return unless user.respond_to?(:local_avatar_attachment) &&
                          user.local_avatar_attachment

            with_default_avatar_options(user, options) do |email, opts|
              block.call(email, opts)
            end
          end
        end
      end
    end
  end
end
