OpenProject Dark-Theme Plugin
=============================

This Plugin adds the dark theme to OpenProject which provides an alternative to the default OpenProject theme. The theme can be activated in the account settings for each individual user.

A more detailed description can be found on [OpenProject.org](https://community.openproject.org/projects/dark-theme).


Requirements
------------

The OpenProject Dark-Theme plugin requires the [OpenProject Core](https://github.com/opf/openproject/) in the same version.


Installation
------------

For OpenProject Dark-Theme plugin you need to add the following line to the `Gemfile.plugins` of OpenProject (if you use a different OpenProject version than OpenProject 5, adapt `:branch => "stable/5"` to your OpenProject version):

`gem "openproject-themes-dark", git: "https://github.com/finnlabs/openproject-themes-dark.git", :branch => "stable/5"`

Afterwards, run:

`bundle install`

This plugin contains migrations. To migrate the database, run:

`rake db:migrate`


Deinstallation
--------------

Remove the line

`gem "openproject-themes-dark", git: "https://github.com/finnlabs/openproject-themes-dark.git", :branch => "stable/5"`

from the file `Gemfile.plugins` and run:

`bundle install`

Please not that this leaves plugin data in the database. Currently, we do not support full uninstall of the plugin.


Bug Reporting
-------------

If you find any bugs, you can create a bug ticket at

https://community.openproject.org/projects/dark-theme


Development
-----------

To contribute, you can create pull request on the official repository at
`https://github.com/finnlabs/openproject-themes-dark`


Licence
-------

Copyright (C) 2013 - 2015 the OpenProject Foundation (OPF)

This plugin is licensed under the GNU GPL v3. See doc/COPYRIGHT.md and doc/GPL.txt for details.
