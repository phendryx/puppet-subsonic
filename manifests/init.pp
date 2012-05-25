# Max memory in megabytes
define subsonic (
                 $http_port = 'undef',
                 $https_port = 'undef',
                 $max_memory = '128',
                ){

  include subsonic::service
  include subsonic::install


  file { '/etc/default/subsonic':
    owner   => 'root',
    group   => 'root',
    content => template('subsonic/default.erb'),
    notify  => Service['subsonic'],
  }
}
