class apt::repo::getdeb {

  include apt::update

  file { '/etc/apt/sources.list.d/getdeb.list':
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/apt/repo/getdeb.list',
    notify  => Apt::Key['getdeb'],
  }

  apt::key { 'getdeb':
    ensure      => present,
    apt_key_url => 'http://archive.getdeb.net/getdeb-archive.key',
    notify      => Exec['apt_update'],
  }
    

}
