class general{
  
    exec { "apt-update":
      command => "/usr/bin/sudo apt-get -y update",
    }
  
    package { 
      [ "curl", "vim", "git-core", "subversion", "mercurial", "python", "python-setuptools", "python-dev", "build-essential", "python-pip", "python-virtualenv", "virtualenvwrapper", "libxml2-dev", "libxslt-dev", "libgeoip-dev", "gettext"]:
      ensure => ["installed"],
      require => Exec['apt-update'],
    }
}

class pil_related {

    package {
      ["libjpeg-dev", "libfreetype6-dev", "zlib1g-dev", "liblcms1-dev"]:
      ensure => ["installed"],
      require => Exec['apt-update'],
    }

    file { '/usr/lib/libfreetype.so':
      ensure => link,
      target => '/usr/lib/x86_64-linux-gnu/libfreetype.so',
      require => Package["libfreetype6-dev"],
    }

    file { '/usr/lib/libjpeg.so':
      ensure => link,
      target => "/usr/lib/x86_64-linux-gnu/libjpeg.so",
      require => Package["libjpeg-dev"],
    }

    file { '/usr/lib/libz.so':
      ensure => link,
      target => "/usr/lib/x86_64-linux-gnu/libz.so",
      require => Package["zlib1g-dev"],
    }

    file { "/usr/lib/liblcms.so":
      ensure => link,
      target => "/usr/lib/x86_64-linux-gnu/liblcms.so",
      require => Package["liblcms1-dev"],
    }
}



class services {
  
  exec { "apt-update-repo":
    command => "/usr/bin/apt-get -y update"
  }

  package {
    ["mysql-client", "mysql-server", "libmysqlclient-dev", "redis-server", "rabbitmq-server", "memcached"]: 
    ensure => installed, 
    require => Exec['apt-update']
  }
  
  service { "mysql":
    ensure => running,
    enable => true,
    require => Package["mysql-server"],  
  }

  service { "redis-server":
    ensure => running,
    enable => true,
    require => Package["redis-server"],  
  }

  service { "rabbitmq-server":
    ensure => running,
    enable => true,
    require => Package["rabbitmq-server"],  
  }

  service { "memcached":
    ensure => running,
    enable => true,
    require => Package["memcached"]
  }
  
}

include general
include services
include pil_related
