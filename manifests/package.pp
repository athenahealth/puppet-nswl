# == Class: nswl::package
#
# This class exists to coordinate all software package management related
# actions, functionality and logical units in a central place.
#
#
# === Parameters
#
# This class does not provide any parameters.
#
#
# === Examples
#
# This class may be imported by other classes to use its functionality:
#   class { 'nswl::package': }
#
# It is not intended to be used directly by external resources like node
# definitions or other modules.
#
#
# === Authors
#
# * Stas Alekseev <mailto:me@salekseev.com>
#
class nswl::package {

  #### Package management

  # set params: in operation
  if $nswl::ensure == 'present' {

    # Check if we want to install a specific version or not
    if $nswl::version == false {

      $package_ensure = $nswl::autoupgrade ? {
        true  => 'latest',
        false => 'present',
      }

    } else {

      # install specific version
      $package_ensure = $nswl::version

    }

  # set params: removal
  } else {
    $package_ensure = 'purged'
  }

  # action
  package { $nswl::params::package:
    ensure   => $package_ensure,
  }

}
