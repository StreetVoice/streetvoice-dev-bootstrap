python-packages:
  pkg.installed:
    - names:
      - build-essential
      - python-dev
      - python-virtualenv
      - virtualenvwrapper
      - libxml2-dev
      - libxslt-dev
      - libmemcached-dev
      - curl
      - python
      - python-setuptools     
      - libmysqlclient18
      - libmysqlclient-dev
      - ffmpeg
      - libavcodec-extra-53

pillow-packages:
  pkg.installed:
    - names:
      - libjpeg-dev
      - libfreetype6-dev
      - zlib1g-dev
      - liblcms1-dev

/usr/lib/libfreetype.so:
  file.symlink:
    - target: /usr/lib/x86_64-linux-gnu/libfreetype.so
    - require:
      - pkg: pillow-packages


/usr/lib/libjpeg.so:
  file.symlink:
    - target: /usr/lib/x86_64-linux-gnu/libjpeg.so
    - require:
      - pkg: pillow-packages


/usr/lib/libcms.so:
  file.symlink:
    - target: /usr/lib/x86_64-linux-gnu/libcms.so
    - require:
      - pkg: pillow-packages


/usr/lib/libz.so:
  file.symlink:
    - target: /usr/lib/x86_64-linux-gnu/libz.so
    - require:
      - pkg: pillow-packages
