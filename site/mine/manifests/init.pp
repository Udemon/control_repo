class mine {
  file {'/opt/mc':
    ensure => directory,
  }
  file {'/opt/mc/mc.jar':
    ensure => present,
    source => 'https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar',
  }
  package {'java':
    ensure => present,
  }
  file {'/opt/mc/eula.txt':
    ensure  => present,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/mine.service':
    ensure => present,
    source => puppet:///modules/mine/mine.service',
  }
  service {'mine':
    ensure => running,
    enable => true,
  }
}  
