class subsonic::install {

  apt::customrepo { 'getdeb':
    key_url => '',
    source_location => ''
  }

  package { 'openjdk-6-jre':
    ensure => present,
  }

  package {
    'subsonic':
      ensure  => present,
      require => [ Apt::Customrepo['getdeb'] , Package['openjdk-6-jre'] ]
  }

}
