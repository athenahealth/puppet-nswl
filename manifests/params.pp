# == Class: nswl::params
#
# This class exists to
# 1. Declutter the default value assignment for class parameters.
# 2. Manage internally used module variables in a central place.
#
# Therefore, many operating system dependent differences (names, paths, ...)
# are addressed in here.
#
#
# === Parameters
#
# This class does not provide any parameters.
#
#
# === Examples
#
# This class is not intended to be used directly.
#
#
# === Links
#
# * {Puppet Docs: Using Parameterized Classes}[http://j.mp/nVpyWY]
#
#
# === Authors
#
# * Stas Alekseev <mailto:me@salekseev.com>
#
class nswl::params {

  #### Default values for the parameters of the main module class, init.pp

  # ensure
  $ensure = 'present'

  # autoupgrade
  $autoupgrade = false

  # service status
  $status = 'enabled'

  # User and Group for the files and user to run the service as.
  $nswl_user  = 'root'
  $nswl_group = 'root'

  #### Internal module values

  # packages
  case $::osfamily {
    'RedHat': {
      # main application
      $package = [ 'NSweblog' ]
    }
    default: {
      fail("\"${module_name}\" provides no package default value
            for \"${::osfamily}\"")
    }
  }

  # service parameters
  case $::osfamily {
    'RedHat': {
      $service_name       = 'nswl'
      $service_hasrestart = true
      $service_hasstatus  = true
      $service_pattern    = $service_name
    }
    default: {
      fail("\"${module_name}\" provides no service parameters
            for \"${::osfamily}\"")
    }
  }

}
