# == Define: keepalived::vrrp::track_file
#
# === Parameters:
#
# $ensure::       Default: present
#
# $track_file::   Which file to track.
#                 Default: undef
#
define keepalived::vrrp::script (
  String[1] $track_file,
  $ensure    = present,
) {
  $_name = regsubst($name, '[:\/\n]', '_')

  concat::fragment { "keepalived.conf_vrrp_track_file_${_name}":
    ensure  => $ensure,
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/vrrp_track_file.erb'),
    order   => '002',
  }
}
