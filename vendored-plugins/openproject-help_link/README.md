OpenProject Help Link
=====================

This plugin allows you to change the target of the help link in your
OpenProject. Doing so allows you to e.g. have a support project within your OpenProject.

Requirements
------------

The OpenProject Help Link plugin requires the [OpenProject Core](https://github.com/opf/openproject/) in version greater or equal to *3.0.0*.

Installation
------------

For OpenProject Help Link itself you need to add the following line to the `Gemfile.plugins` of OpenProject (if you use a different OpenProject version than OpenProject 5, adapt `:branch => "stable/5"` to your OpenProject version):

`gem "openproject-help_link", git: "https://github.com/finnlabs/openproject-help_link.git", :branch => "stable/5"`

Afterwards, run:

`bundle install`

This plugin contains migrations. To migrate the database, run:

`rake db:migrate`

Usage
-----

The url of the help link is configurable with this plugin. You can set the url in:

Administration > Plugins > Configure (in the "OpenProject Help Link Changer" row)

Deinstallation
--------------

Remove the line

`gem "openproject-help_link", git: "https://github.com/finnlabs/openproject-help_link.git", :branch => "stable/5"`

from the file `Gemfile.plugins` and run:

`bundle install`

Bug Reporting
-------------

If you find any bugs, you can create a bug ticket at

https://www.openproject.org/projects/help-link-changer


Development
-----------

To contribute, you can create pull request on the official repository at
`https://github.com/finnlabs/openproject-help_link`

Credits
-------

Special thanks go to

* Deutsche Telekom AG (opensource@telekom.de) for project sponsorship

Licence
-------

Copyright (C) 2011 - 2015 the OpenProject Foundation (OPF)

This plugin is licensed under the GNU GPL v3. See doc/COPYRIGHT.md and doc/GPL.txt for details.
