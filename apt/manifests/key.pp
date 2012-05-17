# Adapted from http://projects.puppetlabs.com/projects/1/wiki/Apt_Keys_Patterns
define apt::key($ensure,
                $apt_key_url) {
  case $ensure {
    'present': {
      exec { "apt-key present $name":
        command => "/usr/bin/wget -q $apt_key_url -O - | /usr/bin/apt-key add -",
        unless  => "/usr/bin/apt-key list | /bin/grep -c $name",
      }
    }
    'absent': {
      exec { "apt-key absent $name":
        command => "/usr/bin/apt-key del $name",
        onlyif  => "/usr/bin/apt-key list | /bin/grep -c $name",
      }
    }
    default: {
      fail "Invalid 'ensure' value '$ensure' for apt::key"
    }
  }
}
