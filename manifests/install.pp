# == Class: go_relay::install
# == Description: Creates the user/group, installs the package and creates the config dir.

class graphite_go_relay::install (
  $version = $graphite_go_relay::params::version,
  $install_dir = $graphite_go_relay::params::install_dir,
  $mirror_url = $graphite_go_relay::params::mirror_url,
  $package_dir = $graphite_go_relay::params::package_dir,
  $package_url = $graphite_go_relay::params::package_url,
  $basefilename = $graphite_go_relay::params::basefilename,
) inherits graphite_go_relay::params {
  user { $::user:
    ensure  => present,
    shell   => '/bin/bash',
    require => Group[$::group]
  }
  group { $::group:
    ensure => present
  }

  file { '/var/log/graphite_go_relay':
    ensure => directory,
    owner  => $::user,
    group  => $::group
  }
  exec { 'download-graphite_go_relay-package':
    command => "wget -O ${package_dir}/${basefilename} ${package_url} 2> /dev/null",
    path    => ['/usr/bin', '/bin'],
    creates => "${package_dir}/${basefilename}",
    require => [ Package['wget'] ],
    unless  => 'test -d /usr/bin/graphite_go_relay'
  }

  exec { 'untar-graphite_go_relay-package':
    command => "tar xfzv ${package_dir}/${basefilename} -C ${install_dir}",
    alias   => 'untar-graphite_go_relay',
    require => [ Exec['download-graphite_go_relay-package'] ],
    path    => ['/bin', '/usr/bin', '/usr/sbin'],
    unless  => 'test -d /usr/bin/graphite_go_relay'
  }
}

