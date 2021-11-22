node default {
}
node 'master.puppet.vm' {
  include role::control_server
}
