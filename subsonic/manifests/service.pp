class subsonic::service {

  service { 'subsonic':
    hasstatus  => true,
    hasrestart => true,
    ensure     => running,
    require    => Package['subsonic']
  }
}
