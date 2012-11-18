class subsonic::proxy inherits subsonic::params {
    if $proxy_nginx {
        include nginx
        nginx::resource::upstream { 'subsonic':
            ensure  => present,
            members => "$subsonic_host:$subsonic_port",
        }
        nginx::resource::location { 'subsonic':
            ensure   => present,
            proxy  => 'http://subsonic',
            location => "$subsonic_webroot",
            vhost    => "$external_dns",
        }
    }
}
