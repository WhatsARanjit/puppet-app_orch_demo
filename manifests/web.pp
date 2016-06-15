define myapp::web (
  $app_ip = $ipaddress,
  $port   = '8081',
) {

  class { 'apache':
    default_vhost => false,
  }

  include apache::mod::proxy
  include apache::mod::proxy_html

  file { "${apache::confd_dir}/proxy.conf":
    ensure  => file,
    owner   => $apache::user,
    group   => $apache::group,
    mode    => '0644',
    content => template("${module_name}/proxy.conf.erb"),
  }

}

Myapp::Web consumes Proxy_dest {
  app_ip => $host,
  port   => $port,
}
