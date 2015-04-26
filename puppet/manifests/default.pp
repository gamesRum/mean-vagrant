$user = hiera("user")
$source_folder = hiera("source_folder")
$node_version = hiera("nodejs_version")
$npm_packages = hiera_array("npm_packages")

file { "/etc/motd":
  content => "
*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=

     Node/MongoDB Dev Server

- OS:      Ubuntu 14.04 (trusty 64)
- Node:    ${node_version}
- IP:      10.0.0.10

*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
\n"
}

class { "setup":
  user            => $user,
  source_folder   => $source_folder,
  node_version    => $node_version,
  npm_packages    => $npm_packages
}
