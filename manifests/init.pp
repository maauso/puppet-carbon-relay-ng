# Init class, we use it for check some variables and run instalation and config

class graphite_go_relay(
  $ensure                   = 'present',
  $package_name             = $graphite_go_relay::params::package_name,
  $version                  = $graphite_go_relay::params::version,
  $executable               = $graphite_go_relay::params::executable,
  $systemd_service_folder   = $graphite_go_relay::params::systemd_service_folder,
  $config_dir               = $graphite_go_relay::params::config_dir,
  $user                     = $graphite_go_relay::params::user,
  $group                    = $graphite_go_relay::params::group,
  $download_package         = $graphite_go_relay::params::basefilename
) {

  validate_re($::osfamily, '^(RedHat|Debian)', 'This module is only testing on RHEL/CentOS 7')
  validate_re($::operatingsystemmajrelease, '^[7]', 'This module is only supported on RHEL/CentOS 7')

  validate_string($version)
  validate_string($executable)
  validate_string($user)
  validate_string($group)

  class { 'graphite_go_relay::install': } ->
  class { 'graphite_go_relay::config':  } ->
  class { 'graphite_go_relay::service': } ->
  Class['graphite_go_relay']
}

