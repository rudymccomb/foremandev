class users::nosudopurge{

class { 'sudo':
  purge               => false,
  config_file_replace => false,
}

}
