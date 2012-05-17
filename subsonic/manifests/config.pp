class subsonic::config {
  file { '/etc/default/subsonic':
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/subsonic/etc/default/subsonic',
    notify => Service['subsonic'],
  }
}
