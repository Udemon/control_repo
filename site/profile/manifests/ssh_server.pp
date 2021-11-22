class profile::ssh_server {
  package {'openssh-server':
    ensure => present,
  }
  service { 'sshd':
    ensure => 'running',
    enable => 'true',
  }
  ssh_authorized_key { 'root@master.puppet.vm':
    ensure => present,
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCvaRcaNe0MinnZ5ql4oNSCPBaySp5vsg5nr/ZRc6nlLUsey+hVI86QDnnwz+ZGHPYETQN5/p3y3OQliJ+oQ9f8yCHunaJY/UD0o8t1wfEw0vZ0/5jk0F89bwS/U9QzhUDpaqMmmizvBZFPZqLzrDLiImDgh6MXj5RO4UdSyOmBIBg+x57An0VpdORSH7WOmQ3htWpevr9ThFjNC6GGNLBK1AzvZFHv9zCwtFQAc2S4MB8LvX6+zqbOHjXkaEI6UlxaIovS+tHVffpSW1NuUvspsIHl5b9CptcDtgwKpPbfF3JsSmtRjHkBeT72s5Qhh5GTA3GUX7pdWwhBvkGYpuUN',
  }
}
