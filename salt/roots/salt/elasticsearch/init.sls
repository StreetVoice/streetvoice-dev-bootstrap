elasticsearch-requirements:
  pkg.installed:
    - pkgs:
      - openjdk-7-jre-headless
      - curl

elasticsearch:
  pkg.installed:
    - sources:
      - elasticsearch: https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.2.deb
    - require:
      - pkg: elasticsearch-requirements
  service:
    - running
    - watch:
      - file: /etc/elasticsearch/elasticsearch.yml


/etc/elasticsearch/elasticsearch.yml:
  file.managed:
    - unless: grep "ElasticSearch Configuration Example" /etc/elasticsearch/elasticsearch.yml
    - source: salt://elasticsearch/files/elasticsearch.yml
    - template: jinja
    - require:
      - pkg: elasticsearch
