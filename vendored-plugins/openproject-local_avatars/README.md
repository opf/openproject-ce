# OpenProject Local Avatars Plugin

This plugin allows users to upload an avatar picture to their user profile. So users do not need to use external avatar providers.

Requirements
------------

The OpenProject Local Avatars plugin requires the [OpenProject Core](https://github.com/opf/openproject/) to be in the same version as the plugin.

Installation
------------

To install the OpenProject Local Avatars plugin you need to add the following line to the `Gemfile.plugins` in your OpenProject folder (if you use a different OpenProject version than OpenProject 5, adapt `:branch => "stable/5"` to your OpenProject version):

`gem "openproject-local_avatars", git: "https://github.com/finnlabs/openproject-local_avatars", :branch => "stable/5"`

Afterwards, run:

`bundle install`

Deinstallation
--------------

Remove the line

`gem "openproject-local_avatars", git: "https://github.com/finnlabs/openproject-local_avatars", :branch => "stable/5"`

from the file `Gemfile.plugins` and run:

`bundle install`

Bug Reporting
-------------

If you find any bugs, you can create a bug ticket at
https://community.openproject.org/projects/local-avatars

Development
-----------

To contribute, you can create pull request on the official repository at
`https://github.com/finnlabs/openproject-local_avatars`

Authors
-------

A. Chaika wrote the original version:
* http://www.redmine.org/boards/3/topics/5365
* https://github.com/Ubik/redmine_local_avatars

Luca Pireddu <pireddu@gmail.com> at CRS4 (http://www.crs4.it), contributed updates and improvements.

Copyright
-------

* Copyright (C) 2010  Andrew Chaika, Luca Pireddu
* Copyright (C) 2011-2015 OpenProject GmbH

Licence
-------

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
