geoip-packages:
  pkg.installed:
    - names:
      - libgeoip-dev

/usr/share/GeoIP/GeoIP.dat:
  file.managed:
    - source: salt://geoip/files/GeoIP.dat
    - user: root
    - group: root
    - mode: 644

/usr/share/GeoIP/GeoLiteCity.dat:
  file.managed:
    - source: salt://geoip/files/GeoLiteCity.dat
    - user: root
    - group: root
    - mode: 644
