celery-server:
  service.running:
    - name: celeryd
    - enable: True
    - require:
       - file: upstart-celeryd

upstart-celeryd:
  file.managed:
    - name: /etc/init/celeryd.conf
    - source: salt://celery/upstart
