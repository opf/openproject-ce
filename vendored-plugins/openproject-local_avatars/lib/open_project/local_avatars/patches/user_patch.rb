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

require 'rmagick'

module OpenProject::LocalAvatars
  module Patches
    module UserPatch
      def self.included(base) # :nodoc:
        base.class_eval do
          acts_as_attachable
          include InstanceMethods
        end
      end

      module InstanceMethods
        def local_avatar_attachment
          self.attachments.find_by_description('avatar')
        end

        def local_avatar_attachment=(file)
          image = Magick::Image.from_blob(file.read).first
          image.crop_resized!(128, 128) if image.columns > 128 || image.rows > 128
          image.write(file.tempfile.path)
          file.tempfile.rewind

          local_avatar_attachment.destroy if local_avatar_attachment
          Attachment.attach_files(self, {'first' => {'file' => file, 'description' => 'avatar'}})
        end
      end
    end
  end
end
