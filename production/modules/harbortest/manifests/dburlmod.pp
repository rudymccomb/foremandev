class foo::dburlmod {


exec { 'update_core_unsecure_base_url':
   command   => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"USE Magento; UPDATE core_config_data SET value = 'http://www.foo.com/' WHERE PATH = 'web/unsecure/base_url' AND SCOPE = 'default' AND SCOPE_ID = '0';\"",
   #require => Exec ["update_core_secure_base_url"]
}


exec { 'update_core_secure_base_url':
   command   => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"USE Magento; UPDATE core_config_data SET value = 'https://shop.foo.com/' WHERE PATH = 'web/secure/base_url' AND SCOPE = 'default' AND SCOPE_ID = '0';\"",
   #require => Class ["Magento"]
}

exec { 'update_core_admin_url':
   command   => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"USE Magento; UPDATE core_config_data SET value = 'https://admin.foo.com/' WHERE PATH = 'admin/url/custom' AND SCOPE = 'default' AND SCOPE_ID = '0';\"",
   #require => Exec ["update_core_unsecure_base_url"]
}

#if url is not correct checkout page and process will not work.
#secure should be https
exec { 'update_base_url-stores-unsecure':
   command   => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"USE Magento; UPDATE core_config_data SET value = 'https://admin.foo.com/' WHERE PATH = 'web/unsecure/base_url' AND SCOPE = 'stores' AND SCOPE_ID = '0';\"",
#   require => Exec ["update_core_cookie_domain"]
}

exec { 'update_base_url-stores-secure':
   command   => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"USE Magento; UPDATE core_config_data SET value = 'https://admin.foo.com/' WHERE PATH = 'web/secure/base_url' AND SCOPE = 'stores' AND SCOPE_ID = '0';\"",
#   require => Exec ["update_core_cookie_domain"]
}

exec { 'update_core_easyask_dictionary':
   command   => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"USE Magento; UPDATE core_config_data SET value = 'EcommTest' WHERE PATH = 'easyask/catalogsearch/easyask_dictionary' AND SCOPE = 'default' AND SCOPE_ID = '0';\"",
#   require => Exec ["update_core_unsecure_base_url"]
}

exec { 'update_core_easyask_unsecure_log':
   command   => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"USE Magento; UPDATE core_config_data SET value = 'http://ea.foo.com:9200/EasyAsk/apps/Log.jsp' WHERE PATH = 'easyask/tagging/easyask_tagging_url' AND SCOPE = 'default' AND SCOPE_ID = '0';\"",
#   require => Exec ["update_core_unsecure_base_url"]
}

exec { 'update_core_easyask_secure_log':
   command   => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"USE Magento; UPDATE core_config_data SET value = 'https://ea.foo.com:9143/EasyAsk/apps/Log.jsp' WHERE PATH = 'easyask/tagging/easyask_tagging_url_secure' AND SCOPE = 'default' AND SCOPE_ID = '0';\"",
   #require => Exec ["update_core_unsecure_base_url"]
}

exec { 'update_core_easyask_unsecure_advisor':
   command   => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"USE Magento; UPDATE core_config_data SET value = 'http://ea.foo.com:9200/EasyAsk/apps/Advisor.jsp' WHERE PATH = 'easyask/catalogsearch/easyask_serviceurl' AND SCOPE = 'default' AND SCOPE_ID = '0';\"",
#   require => Exec ["update_core_unsecure_base_url"]
}

#easyask cluster
exec { 'update_core_easyask_unsecure_catalogsearch':
   command   => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"USE Magento; UPDATE core_config_data SET value = 'http://ea.foo.com:9200/EasyAsk/apps/Advisor.jsp' WHERE PATH = 'catalogsearch/catalogsearch/easyask_serviceurl' AND SCOPE = 'default' AND SCOPE_ID = '0';\"",
#   require => Exec ["update_core_unsecure_base_url"]
}

exec { 'update_core_easyask_auto_js_path':
   command   => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"USE Magento; UPDATE core_config_data SET value = 'https://ea.foo.com:9143/EasyAsk/js/eascriptcomplete.js' WHERE PATH = 'easyask/autocomplete/auto_js_path' AND SCOPE = 'default' AND SCOPE_ID = '0';\"",
#   require => Exec ["update_core_unsecure_base_url"]
}

exec { 'update_core_easyask_auto_jsp_path':
   command   => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"USE Magento; UPDATE core_config_data SET value = 'https://ea.foo.com:9143/EasyAsk/AutoComplete.jsp' WHERE PATH = 'easyask/autocomplete/auto_jsp_path' AND SCOPE = 'default' AND SCOPE_ID = '0';\"",
#   require => Exec ["update_core_unsecure_base_url"]
}

#updates safenet url
#production @ rackspace ip: ssl://172.17.0.175
#foo: ssl://63.147.22.180
exec { 'update_safenet_settings':
   command   => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"USE Magento; UPDATE core_config_data SET value = 'ssl://63.147.22.180' WHERE PATH = 'FOO_encrypt/safenet_settings/hostname' AND SCOPE = 'default' AND SCOPE_ID = '0';\"",
#   require => Exec ["update_core_unsecure_base_url"]
}

#creates dev_user
exec { 'dev_user_and_grants_Upgrade1':
<<<<<<< HEAD
command => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"GRANT ALL PRIVILEGES ON Upgrade1.* TO 'dev_user'@'localhost' IDENTIFIED BY 'M0r3GVi9';\"",
=======
<<<<<<< HEAD
command => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"GRANT ALL PRIVILEGES ON Upgrade1.* TO 'dev_user'@'localhost' IDENTIFIED BY 'M0r3GVi9';\"",
=======
command => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"GRANT ALL PRIVILEGES ON Upgrade1.* TO 'dev_user'@'localhost' IDENTIFIED BY 'R4CNJuiW';\"",
>>>>>>> 844e96c6f5ffe1c596e4c957e574ad537576738e
>>>>>>> bdcfca248f336f66ebf16fa49ea100e49277f7ad
}

#creates dev_user
exec { 'dev_user_and_grants_remote_Upgrade1':
<<<<<<< HEAD
command => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"GRANT ALL PRIVILEGES ON Upgrade1.* TO 'dev_user'@'%' IDENTIFIED BY 'M0r3GVi9';\"",
=======
<<<<<<< HEAD
command => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"GRANT ALL PRIVILEGES ON Upgrade1.* TO 'dev_user'@'%' IDENTIFIED BY 'M0r3GVi9';\"",
=======
command => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"GRANT ALL PRIVILEGES ON Upgrade1.* TO 'dev_user'@'%' IDENTIFIED BY 'R4CNJuiW';\"",
>>>>>>> 844e96c6f5ffe1c596e4c957e574ad537576738e
>>>>>>> bdcfca248f336f66ebf16fa49ea100e49277f7ad
}

#creates dev_user
exec { 'dev_user_and_grants_Upgrade2':
<<<<<<< HEAD
command => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"GRANT ALL PRIVILEGES ON Upgrade2.* TO 'dev_user'@'localhost' IDENTIFIED BY 'M0r3GVi9';\"",
=======
<<<<<<< HEAD
command => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"GRANT ALL PRIVILEGES ON Upgrade2.* TO 'dev_user'@'localhost' IDENTIFIED BY 'M0r3GVi9';\"",
=======
command => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"GRANT ALL PRIVILEGES ON Upgrade2.* TO 'dev_user'@'localhost' IDENTIFIED BY 'R4CNJuiW';\"",
>>>>>>> 844e96c6f5ffe1c596e4c957e574ad537576738e
>>>>>>> bdcfca248f336f66ebf16fa49ea100e49277f7ad
}

#update cookie domain
exec { 'update_core_cookie_domain':
   command   => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"USE Magento; UPDATE core_config_data SET value = '.foo.com' WHERE PATH = 'web/cookie/cookie_domain';\"",
   #require => Exec ["update_core_admin_url"]
}

exec { 'flush privileges':
   command   => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"USE Magento; flush privileges;\"",
   require => Exec ["update_core_cookie_domain"]
  }

}
