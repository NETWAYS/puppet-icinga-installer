# @summary install
# Base class for the icinga-installer
#
# @param [Enum['file', 'syslog']] logging
#   Switching the log target.
#
# @param [Icinga2::LogSeverity] log_level
#   Setting the log level.
#
# @param [Optional[Icinga2::LogFacility]] syslog_facility	condition: $logging == 'syslog'
#   The syslog target facility.
#
class install(
  Enum['file', 'syslog']   $logging         = 'file',
  Icinga2::LogSeverity     $log_level       = 'warning',
  Icinga2::LogFacility     $syslog_facility = 'LOG_SYSLOG',
) inherits install::params {

  if $logging == 'file' {
    $mainlog_ensure = 'present'
    $syslog_ensure  = 'absent'
  } else {
    $mainlog_ensure = 'absent'
    $syslog_ensure  = 'present'
  }

  class { 'icinga2::feature::mainlog':
    ensure   => $mainlog_ensure,
    severity => $log_level,
  }

  class { 'icinga2::feature::syslog':
    ensure   => $syslog_ensure,
    severity => $log_level,
    facility => $syslog_facility,
  }
}
