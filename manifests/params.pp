class subsonic::params (
    $base_dir = hiera("app_dir", "/opt"),
    $subsonic_port = hiera("subsonic_port", "4040"),
    $subsonic_host = hiera("subsonic_host", "127.0.0.1"),
    $subsonic_webroot = hiera("subsonic_webroot", "/subsonic"),
    $subsonic_version = "4.7",
    $https_port = 'undef',
    $max_memory = '128',
    $music_dir = hiera("music_dir"),
    $external_dns = hiera("external_dns", "localhost"),
    $proxy_nginx = hiera("proxy_nginx", "false"),
    $proxy_apache = hiera("proxy_apache", "false"),
    $logrotate = hiera("logrotate", "false"),
    ){
    $services_user = hiera("services_user")
    $log_dir = "$base_dir/subsonic/log"
    $data_dir = "$base_dir/subsonic/data"
}
