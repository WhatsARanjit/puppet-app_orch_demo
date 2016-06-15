define myapp::web (
  $app_ip = $ipaddress,
  $port   = '8081',
) {

  include apache
  include apache::mod::proxy
  include apache::mod::proxy_html
  include apache::mod::proxy_http

  file { "${apache::confd_dir}/proxy.conf":
    ensure  => file,
    owner   => $apache::user,
    group   => $apache::group,
    mode    => '0644',
    content => template("${module_name}/proxy.conf.erb"),
  }

}

Myapp::Web consumes Proxy_dest {
  name   => $name,
  app_ip => $host,
  port   => $port,
}
