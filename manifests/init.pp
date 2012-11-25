class subsonic inherits subsonic::params {
    include java
    include subsonic::service
    include subsonic::config
    include subsonic::proxy
    $tar_output = "$base_dir/subsonic/subsonic-$subsonic_version-standalone.tar.gz"

#    user { "$services_user":
#        allowdupe => false,
#        ensure => 'present',
#    }

    file { "$base_dir/subsonic":
        ensure => directory,
        owner => "$services_user",
        group => "$services_user",
        mode => '0644',
    }

    exec { 'download-subsonic':
        command => "wget -O ${tar_output} http://sourceforge.net/projects/subsonic/files/subsonic/${subsonic_version}/subsonic-${subsonic_version}-standalone.tar.gz/download?use_mirror=autoselect",
        cwd     => "$base_dir/subsonic/",
        path    => '/usr/bin/',
        user    => "$services_user",
        creates => "$tar_output",
    }

    exec { 'extract-subsonic':
        command => "tar zxf $tar_output",
        path    => '/bin/',
        cwd     => "$base_dir/subsonic/",
        creates    => "$base_dir/subsonic/subsonic.war",
        require => [Exec['download-subsonic'],File["$base_dir/subsonic"]],
    } 
}
