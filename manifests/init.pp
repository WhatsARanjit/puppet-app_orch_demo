application myapp (
  $port = '8081',
) {

  myapp::app { 'PVD':
    port   => $port,
    export => Proxy_dest['PVD'],
  }

  myapp::web { 'PVD':
    consume => Proxy_dest['PVD'],
  }

}
