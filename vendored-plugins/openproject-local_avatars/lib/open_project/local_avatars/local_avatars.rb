# Redmine Local Avatars plugin
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
  module LocalAvatars
    private

    def save_or_delete_avatar
      current_attachment = @user.local_avatar_attachment
      if params[:delete]
        if current_attachment and current_attachment.destroy
          flash[:notice] = l(:avatar_deleted)
        else
          flash[:error] = l(:unable_to_delete_avatar)
          false
        end
      else

        avatar = params[:avatar];
        if avatar.nil?
          flash[:error] = l(:empty_file_error)
          return
        end

        unless avatar.original_filename =~ /\.(jpe?g|gif|png)\z/i
          flash[:error] = l(:wrong_file_format)
          return
        end

        begin
          @user.local_avatar_attachment = avatar
          flash[:notice] = l(:message_avatar_uploaded)
        rescue
          flash[:error] = l(:error_image_upload)
          false
        end
      end
    end
  end
end
