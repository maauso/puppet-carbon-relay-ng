# This class intall and configure service 

class graphite_go_relay::service(
  $user                     = $graphite_go_relay::params::user,
  $group                    = $graphite_go_relay::params::group,
  $service_ensure           = $graphite_go_relay::params::service_ensure,
  $service_enable           = $graphite_go_relay::params::service_enable
) inherits graphite_go_relay::params { 

  service { 'graphite_go_relay.services' :
    provider => systemd,
    require  => File['/etc/systemd/system/graphite_go_relay.service']
  }~>
  exec { 'systemctl-daemon-reload':
    command     => 'systemctl daemon-reload',
    refreshonly => true,
  }
  service { 'graphite_go_relay.service':
    ensure    => $service_ensure,
    enable    => $service_enable,
    provider  => systemd,
    subscribe =>
    [
      File['/etc/systemd/system/graphite_go_relay.service']
    ]
  }

  file { '/etc/systemd/system/graphite_go_relay.service':
    ensure  => present,
    content => template('graphite_go_relay/carbon-relay-ng.service.erb')
  }

}

