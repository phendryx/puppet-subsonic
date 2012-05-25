define subsonic::config (
                         $http_port = 'undef',
                         $https_port = 'undef',
                         $max_memory = '128M',
                        ){
  file { '/etc/default/subsonic':
    owner   => 'root',
    group   => 'root',
    content => template('subsonic/subsonic.erb'),
    notify  => Service['subsonic'],
  }
}
