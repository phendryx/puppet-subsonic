class apt::update {

  # Taken from https://blog.kumina.nl/2010/11/puppet-tipstricks-running-apt-get-update-only-when-needed/
  exec { "apt_update":
    command => "/usr/bin/apt-get update",
    onlyif  => "/bin/sh -c '[ ! -f /var/cache/apt/pkgcache.bin ] || /usr/bin/find /etc/apt/* -cnewer /var/cache/apt/pkgcache.bin | /bin/grep . > /dev/null'",
  }
}
