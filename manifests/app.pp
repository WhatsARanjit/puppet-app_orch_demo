define myapp::app (
  $port = '8081',
) {

  class { 'profiles::app':
    port => $port,
  }
  class { 'profiles::jenkins': }

}

Myapp::App produces Proxy_dest {
  name => $name,
  host => pick($::networking['interfaces']['enp0s8']['ip'], $::ipaddress),
  port => $port,
}
