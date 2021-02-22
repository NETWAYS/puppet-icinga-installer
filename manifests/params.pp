class install::params {

  $backend_db_password = extlib::cache_data('icinga_cache_data', 'backend_db_password', extlib::random_password(32))
  $web_db_password     = extlib::cache_data('icinga_cache_data', 'web_db_password', extlib::random_password(32))
  $ticket_salt         = extlib::cache_data('icinga_cache_data', 'ticket_salt', extlib::random_password(32))
  $web_api_password    = extlib::cache_data('icinga_cache_data', 'web_api_password', extlib::random_password(32))

}
