class mine (
  $install_dir = '/opt/mc',
  $src_url     = 'https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar'
)
{
  file {$install_dir:
    ensure => directory,
  }
  file {"${install_dir}/mc.jar":
    ensure => present,
    source => $src_url,
    before => Service['mine'],
  }
  package {'java':
    ensure => present,
  }
  file {"${install_dir}/eula.txt":
    ensure  => present,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/mine.service':
    ensure  => present,
    content => epp('mine/mine.service',{
      install_dir => $install_dir
    }),
  }
  service {'mine':
    ensure  => running,
    enable  => true,
    require => [Package['java'],File["${install_dir}/eula.txt"],File['/etc/systemd/system/mine.service']],
  }
}  
