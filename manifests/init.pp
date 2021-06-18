# @summary
# This class manages the stages stable, testing and snapshot of packages.icinga.com repository
# and depending on the operating system platform some other repositories.
#
# @param [Boolean] manage_stable
#   Manage the Icinga stable repository. Disabled by setting to 'false'. Defaults to 'true'.
#
# @param [Boolean] manage_testing
#   Manage the Icinga testing repository to get access to release candidates.
#   Enabled by setting to 'true'. Defaults to 'false'.
#
# @param [Boolean] manage_nightly
#   Manage the Icinga snapshot repository to get access to nightly snapshots.
#   Enabled by setting to 'true'. Defaults to 'false'.
#
# @param [Boolean] configure_backports
#   Enables or Disables the backports repository. Has only an effect on plattforms
#   simular to Debian. To configure the backports repo uses apt::backports in hiera.
#
# @param [Boolean] manage_epel
#   Manage the EPEL (Extra Packages Enterprise Linux) repository that is needed for some package
#   like newer Boost libraries. Has only an effect on plattforms simular to RedHat Enterprise.
#
# @param [Boolean] manage_plugins
#   Manage the NETWAYS plugins repository that provides some packages for additional plugins.
#
# @param [Boolean] manage_extras
#   Manage the NETWAYS extras repository that provides some packages for extras.
#
class install(
  Boolean $manage_stable       = true,
  Boolean $manage_testing      = false,
  Boolean $manage_nightly      = false,
  Boolean $configure_backports = $install::params::configure_backports,
  Boolean $manage_epel         = $install::params::manage_epel,
  Boolean $manage_plugins      = $install::params::manage_plugins,
  Boolean $manage_extras       = $install::params::manage_extras,
) inherits install::params {

  class { 'icinga::repos':
    manage_stable       => $manage_stable,
    manage_testing      => $manage_testing,
    manage_nightly      => $manage_nightly,
    configure_backports => $configure_backports,
    manage_epel         => $manage_epel,
    manage_plugins      => $manage_plugins,
    manage_extras       => $manage_extras,
  }

}
