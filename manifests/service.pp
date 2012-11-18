class subsonic::service inherits subsonic::params{
    supervisor::service {
        'subsonic':
            ensure => present,
            enable => true,
            stdout_logfile => "$base_dir/subsonic/log/supervisor.log",
            stderr_logfile => "$base_dir/subsonic/log/supervisor.log",
            command => "java -Xmx${max_memory}m \
                  -Dsubsonic.home=${data_dir} \
                  -Dsubsonic.host=${subsonic_host} \
                  -Dsubsonic.port=${subsonic_port} \
                  -Dsubsonic.contextPath=${subsonic_webroot} \
                  -Dsubsonic.defaultMusicFolder=${music_dir} \
                  -Dsubsonic.defaultPodcastFolder=${data_dir}/podcasts \
                  -Dsubsonic.defaultPlaylistFolder=${data_dir}/playlists \
                  -Djava.awt.headless=true \
                  -verbose:gc \
                  -jar subsonic-booter-jar-with-dependencies.jar",
            user => 'subsonic',
            group => 'subsonic',
            directory => "$base_dir/subsonic/",
            require => [Exec['download-subsonic'],Class['java']],
    }
}
