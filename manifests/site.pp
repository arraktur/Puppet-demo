node master.puppet {
  service { 'firewalld':
    ensure => stopped,
    enable => false,
  }
}

node slave1.puppet {
  package { 'httpd':
    ensure => installed,
  }
  file { '/var/www/html/index.html':
    ensure => present,
    source => "/vagrant/index.html",
  }
  service { 'httpd':
    ensure => running,
    enable => true,
  }
  service { 'firewalld':
    ensure => stopped,
    enable => false,
  }
}

node slave2.puppet {
  package { 'httpd':
    ensure => installed,
  }
  package { 'php':
    ensure => installed,
  }
  file { '/var/www/html/index.php':
    ensure => present,
    source => "/vagrant/index.php",
  }
  service { 'php-fpm':
    ensure => running,
    enable => true,
  }
  service { 'httpd':
    ensure => running,
    enable => true,
  }
  service { 'firewalld':
    ensure => stopped,
    enable => false,
  }
}
