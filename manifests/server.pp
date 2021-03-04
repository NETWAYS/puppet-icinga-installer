# @summary
#   Class to install Icinga server
#
# @param [Array[String]] global_zones
#   List of global zones.
#
# @param [Hash[String,Hash]] workers
#   All worker zones with key 'endpoints' for
#   endpoint objects.
#
# @param [String] ticket_salt
#   Salt to secure ticket certificate requests.
#
# @param [String] web_api_password
#   Icinga API password for user icingaweb2.
#
class install::server(
  Array[String]       $global_zones     = [],
  Hash[String,Hash]   $workers          = {},
  String              $ticket_salt      = $install::params::ticket_salt,
  String              $web_api_password = $install::params::web_api_password,
) inherits install::params {

  class { 'icinga::server':
    global_zones => $global_zones,
    ticket_salt  => $ticket_salt,
    web_api_pass => $web_api_password,
    workers      => $workers,
  }

}
