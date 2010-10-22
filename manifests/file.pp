define xinetd::file(
  $ensure = 'present',
  $source = 'absent',
  $content = 'absent'
){
  include ::xinetd
  file{"/etc/xinetd.d/${name}":
    ensure => $ensure,
    require => Package['xinetd'],
    notify => Service['xinetd'],
    owner => root, group => 0, mode => 0644;
  }

  if $ensure == 'present' {
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
