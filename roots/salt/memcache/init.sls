memcached:
  pkg.installed:
    - names:
      - memcached
  service:
    - running
    - require:
      - pkg: memcached
