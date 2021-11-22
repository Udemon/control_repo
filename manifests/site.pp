node default {
  file { '/root/README':
    ensure  => file,
    content => 'Default README file from manifests',
    owner   => 'root',
  }
}
node 'master.puppet.vm' {
  include role::control_server
}

node /^web/ {
  include role::app_server
}

node /^db/ {
  include role::db_server
}
