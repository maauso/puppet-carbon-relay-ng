# == Class: go_relay-ng::config
# == Description: Creates the directories that the service needs
#                
#
class graphite_go_relay::config (
  $user                     = $graphite_go_relay::params::user,
  $group                    = $graphite_go_relay::params::group,
  $spool_dir                = $graphite_go_relay::params::spool_dir,
  $server_conf_file         = $graphite_go_relay::params::server_conf_file,
  $server_conf_path         = $graphite_go_relay::params::server_conf_path,
  $max_procs                = $graphite_go_relay::params::max_procs,
  $log_level                = $graphite_go_relay::params::log_level
) inherits graphite_go_relay::params {
# resources
    file {  '/etc/graphite-go-relay/carbon-relay-ng.ini' :
      owner   => $user,
      group   => $group,
      mode    => '0644',
      require => [ File['/etc/graphite-go-relay'] ],
      content => template('graphite_go_relay/carbon-relay-ng.ini.erb'),
    }

    file { '/etc/graphite-go-relay' :
      ensure => directory,
      owner  => $user,
      group  => $group
    }
    file { '/var/spool/carbon-relay-ng' :
      ensure => directory,
      owner  => $user,
      group  => $group
    }

}
