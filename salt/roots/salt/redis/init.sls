redis-packages:
  pkg.installed:
    - names:
      - redis-server

redis-server:
  service.running:
    - enable: True
    - watch:
      - pkg: redis-packages
