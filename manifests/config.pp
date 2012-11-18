class subsonic::config {
    if $logrotate {
        logrotate::rule { 'subsonic':
            path          => "$log_dir/*",
            rotate        => 5,
            size          => '100k',
            sharedscripts => true,
            postrotate    => '/usr/bin/supervisorctl restart subsonic',
        }   
    }
    file { "$log_dir":
        ensure => directory,
        owner => 'subsonic',
        group => 'subsonic',
        mode => '0644',
    }
    file { "$base_dir/subsonic/data/":
        ensure => directory,
        owner => 'subsonic',
        group => 'subsonic',
    }
    file { '/etc/default/subsonic':
        owner   => 'subsonic',
        group   => 'subsonic',
        content => template('subsonic/default.erb'),
        notify  => Service['supervisor::subsonic'],
    }
}
