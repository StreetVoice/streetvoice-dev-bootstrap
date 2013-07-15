mysql-package:
  pkg.installed:
    - names:
      - mysql-server
    - require:
      - cmd: apt-update

mysql-server:
  service.running:
    - name: mysql
  require:
    - pkg: mysql-package
