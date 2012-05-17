class apt::repo::webmin {

  include apt::update

  file { '/etc/apt/sources.list.d/webmin.list':
    owner   => 'root',
    group   => 'root',
    content => "puppet:///modules/apt-repo/webmin.list"
  }
}
