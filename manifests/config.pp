class subsonic::config {
    file { "$base_dir/subsonic/data/":
        ensure => directory,
        owner => 'subsonic',
        group => 'subsonic',
    }
    file { "$log_dir":
        ensure => directory,
        owner => 'subsonic',
        group => 'subsonic',
        mode => '0644',
    }
    file { '/etc/default/subsonic':
        owner   => 'subsonic',
        group   => 'subsonic',
        content => template('subsonic/default.erb'),
        notify  => Service['supervisor::subsonic'],
    }
}
