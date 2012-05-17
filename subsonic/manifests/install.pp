class subsonic::install {

  include apt::repo::getdeb
  package { 'openjdk-6-jre':
    ensure => present,
  }

  package {
    'subsonic':
      ensure  => present,
      require => [ Class['apt::repo::getdeb'] , Package['openjdk-6-jre'] ]
  }

}
