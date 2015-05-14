class users::sudopurge{

class { 'sudo':
  purge               => true,
  config_file_replace => true,
}

}
