# == Class: nswl::config
#
# This class exists to coordinate all configuration related actions,
# functionality and logical units in a central place.
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
#   class { 'nswl::config': }
#
# It is not intended to be used directly by external resources like node
# definitions or other modules.
#
#
# === Authors
#
# * Stas Alekseev <mailto:stas.alekseev@gnail.com>
#
class nswl::config {

  #### Configuration

  file { '/etc/nswl/':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644'
  }

  file { '/etc/nswl/nswl.conf':
    tag     => "nswl_config_${::fqdn}",
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    notify  => Service['nswl'],
    require => File['/etc/nswl/']
  }

}
