class ssh::server::config {
  file { $ssh::params::sshd_config:
    ensure  => present,
    owner   => 0,
    group   => 0,
    mode    => '0600',
    content => template("${module_name}/sshd_config.erb"),
    require => Class['ssh::server::install'],
    notify  => Class['ssh::server::service'],
  }
  if ($::ssh::server::shosts_equiv) {
    file { $ssh::params::shosts_equiv:
      ensure  => present,
      owner   => 0,
      group   => 0,
      mode    => '0600',
      content => template("${module_name}/shosts.equiv.erb"),
      require => Class['ssh::server::install'],
      notify  => Class['ssh::server::service'],
    }
  }
}
