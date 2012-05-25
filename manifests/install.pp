class subsonic::install {

  apt::customrepo { 'getdeb':
    key_url => 'http://archive.getdeb.net/getdeb-archive.key',
    source_location => 'subsonic/getdeb.list'
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
