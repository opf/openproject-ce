#-- encoding: UTF-8
#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2017 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
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
#
# See doc/COPYRIGHT.rdoc for more details.
#++

class RemoveFilesAttachedToProjectsAndVersions < ActiveRecord::Migration[4.2]
  def up
    if !skip? && Attachment.where(container_type: ['Version', 'Project']).any?
      raise 'Error: There are still attachments attached to Versions or Projects!'\
            "\n\n"\
            "Consider possible solutions under the rake namespace 'migrations:attachments'."\
            "\n\n"\
            "If you don't need those attachments, use the following rake task:\n"\
            "'migrations:attachments:delete_from_projects_and_versions'."\
            "\n\n"\
            "You can also move all attachments to newly created wiki pages using:\n"\
            "'migrations:attachments:move_to_wiki'\n\n"\
            "Note: Moving the attachments to a wiki will only work after all migrations are done.\n"\
            "      Rerun the migrations with IGNORE_PROJECT_AND_VERSIONS_ATTACHMENTS=true\n"\
            "      in the environment to skip this check. Then run the rake task above to move\n"\
            "      the attachments to wiki pages."
            "\n\n\n"
    end
  end

  def skip?
    String(ENV["IGNORE_PROJECT_AND_VERSIONS_ATTACHMENTS"]) == "true"
  end

  def down
  end
end
