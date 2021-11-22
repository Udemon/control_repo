node default {
}
node 'master.puppet.vm' {
  include role::control_server
  file { '/root/README':
    ensure  => file,
    content => "You're logged on to ${fqdn}.\n Watch your step!!\n",
    owner   => 'root',
  }
}
node 'mc.puppet.vm' {
  include role::mc_server
}
node /^web/ {
  include role::app_server
}
node /^db/ {
  include role::db_server
}
