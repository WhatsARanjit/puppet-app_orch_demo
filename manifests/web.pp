define myapp::web (
  $app_ip = $ipaddress,
  $port   = '8081',
) {

  class { 'profiles::web':
    app_ip => $app_ip,
    port   => $port,
  }

}

Myapp::Web consumes Proxy_dest {
  name   => $name,
  app_ip => $host,
  port   => $port,
}
