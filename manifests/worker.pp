# @summary
#   Class to install Icinga worker
#
# @param [Stdlib:Host] ca_server
#   The CA to send the certificate request to.
#
# @param [String] zone
#   Name of the Icinga zone.
#
# @param [String] parent_zone
#   Name of the parent Icinga zone.
#
# @param [Hash[String,Hash]] parent_endpoints
#   Configures these endpoints of the parent zone.
#
# @param [Array[String]] global_zones
#   List of global zones to configure.
#
class install::worker(
  Stdlib::Host            $ca_server,
  String                  $zone,
  Hash[String, Hash]      $parent_endpoints,
  String                  $parent_zone       = 'main',
  Array[String]           $global_zones      = [],
) inherits install::params {

  class { 'icinga::worker':
    ca_server        => $ca_server,
    zone             => $zone,
    parent_zone      => $parent_zone,
    parent_endpoints => $parent_endpoints,
    global_zones     => $global_zones,
  }

}
