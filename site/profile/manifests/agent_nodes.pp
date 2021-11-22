class profile::agent_nodes{
  include dockeragent
  dockeragent::node{'web.puppet.vm':}
  dockeragent::node{'db.puppet.vm':}
  dockeragent::node{'mc.puppet.vm':}
  host {'web.puppet.vm':
    ensure       => present,
    ip           => '172.18.0.2',
    host_aliases => 'websrv',
  }
  host {'db.puppet.vm':
    ensure       => present,
    ip           => '172.18.0.3',
    host_aliases => 'dbsrv'
  }
  host {'mc.puppet.vm':
    ensure       => present,
    ip           => '172.18.0.4',
    host_aliases => 'mcsrv'
  }
} 
