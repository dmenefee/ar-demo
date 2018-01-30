node:
  version: 6.11.3
  install_from_binary: True
  # Available versions can be found on nodejs.org/dist/
  # checksums are listed in the file SHASUMS256.txt in the respective version’s directory.
  # Package name to look for is nodejs-version-linux-x64.tar.gz
  checksum: 610705d45eb2846a9e10690678a078d9159e5f941487aca20c6f53b33104358c
  global_npm:
    - grunt-cli
    - bower


# For solr 3.x
java: java-1.7.0-openjdk


elasticsearch:
# Tested versions: 5.3.0, 2.4.2
  version: 5.3.0
  config:
    http.cors.enabled: true
    network.bind_host: 0.0.0.0

mysql:
  mysql_version: mysql57u
  database:
    - web
  user:
    web:
      password: root
      host: '%'
      databases:
        - database: web
          grants: ['all privileges']

php:
  ng:
    php_version: php56u

drush:
  version: '8.x'

# Set doc_root for apache and nginx use in jinja
{% set doc_root = 'public' %}


# Define nginx template
include:
  - nginx.drupal:
      defaults:
        document_root: /vagrant/{{doc_root}}

