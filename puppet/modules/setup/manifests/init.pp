class setup($user, $source_folder, $node_version, $npm_packages)
{
  include git

# Default path values
  Exec {
    path => [
      "/usr/local/bin",
      "/usr/local/sbin",
      "/usr/bin/",
      "/usr/sbin",
      "/bin",
      "/sbin",
      "/usr/local/node/node-default/bin"
    ]
  }

# Make sure our code directory has proper permissions
  file { "/vagrant/${source_folder}":
    ensure => "directory",
    mode   => 755
  }

# oh my zsh
  class { "ohmyzsh": }
  ohmyzsh::install { "root": }
  ohmyzsh::theme { ["root"]: theme => "dpoggi" }
  ohmyzsh::plugins { "root": plugins => "git" }

# Install Node
  class { "nodejs":
    version => $node_version,
    require => Class["ohmyzsh"]
  }

# Install mongodb
  class { "mongodb":
    bind_ip => ['0.0.0.0'],
    init    => 'upstart'
  }

  define npm( $directory="/usr/local/node/node-default/lib/node_modules" )
  {
    package { $name:
      provider => "npm",
      require  => Class["nodejs"]
    }
  }

# Global NPM Modules
  npm { $npm_packages:
    require => Class["nodejs"]
  }

# cachefilesd
  exec { 'cachefilesd install':
    cwd     => "/vagrant/setup",
    command => "bash ./cachefilesd.sh"
  }
}
