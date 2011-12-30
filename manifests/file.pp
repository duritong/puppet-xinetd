define xinetd::file(
  $ensure = 'present',
  $source = 'absent',
  $content = 'absent'
){
  file{"/etc/xinetd.d/${name}":
    ensure => $ensure,
  }

  if $ensure == 'present' {
    include ::xinetd
    File["/etc/xinetd.d/${name}"]{
      require => Package['xinetd'],
      notify => Service['xinetd'],
      owner => root, group => 0, mode => 0644
    }
    if $source != 'absent' {
      File["/etc/xinetd.d/${name}"]{
        source => $source,
      }
    } else {
      File["/etc/xinetd.d/${name}"]{
        content => $content,
      }
    }
  }
}
