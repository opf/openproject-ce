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

Feature: Link help to feature
  # As a System Admin
  # I want to relink the help button to a project inside the system
  # So that I can provide help that is customized for the system

  Scenario: HELP link points to public project inside the system
    Given there is 1 user with:
      | login | bob |
    And there is 1 Project with the following:
      | Identifier | tas |
      | Name | Support |
      | Is_public | true |
    And the help link setting points to the project "Support"
    And there is 1 Project with the following:
      | Name | loginproject |
    And there is a role "Loginrole"
    And the user "bob" is a "Loginrole" in the project "loginproject"
    And I am logged in as "bob"
    When I follow "Help" within "#top-menu"
    Then I should be on the page of the project "Support"
