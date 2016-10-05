# == Class: graphite_go_relay::params
# == Description: Default parameters
class graphite_go_relay::params {
  $base_url               = 'http://someurl/tar'
  $path_url               = 'carbon-relay-ng'
  $version                = '0.7'
  $install_dir            = '/usr/bin'
  $package_dir            = '/tmp'
  $basefilename           = 'carbon_relay_ng_0.7.tar.gz'
  $executable             = 'carbon-relay-ng'
  $package_url            = 'http://someurl/tar/carbon-relay-ng/0.7/carbon_relay_ng_0.7.tar.gz'
  $user                   = 'gorelay'
  $group                  = 'gorelay'
  $systemd_service_folder = '/etc/systemd/system/'
  $spool_dir              = '/var/spool/carbon-relay-ng'
  $log_level              = 'notice'
  $server_conf_file       = 'carbon-relay-ng.ini'
  $server_conf_path       = '/etc/graphite_go_relay'
  $max_procs              = '4'
  
}
