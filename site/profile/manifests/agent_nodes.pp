class profile::agent_nodes{
  include dockeragent
  dockeragent::node{'web.puppet.vm':}
  dockeragent::node{'db.puppet.vm':}
  host {'web.puppet.vm':
    ensure => present,
    ip => $::ipaddress,
  }
  host {'db.puppet.vm':
    ensure => present,
    ip => $::ipaddress,
  }
} 
