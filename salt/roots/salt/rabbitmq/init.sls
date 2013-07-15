rabbitmq-server-packages:
  pkg.installed:
    - names:
      - rabbitmq-server

rabbitmq-server:
  service.running:
    - enable: True
    - watch:
      - pkg: rabbitmq-server-packages
