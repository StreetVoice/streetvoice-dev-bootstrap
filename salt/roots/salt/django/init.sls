include:
  - common

python-packages:
  pkg.installed:
    - names:
      - build-essential
      - python
      - python-dev
      - python-setuptools
      - python-pip
      - python-virtualenv
      - virtualenvwrapper
      - curl

ffmpeg-packages:
  pkg.installed:
    - names:
      - ffmpeg
      - libavcodec-extra-53

memcache-lib-packages:
  pkg.installed:
    - names:
      - libmemcached-dev

mysql-client-packages:
  pkg.installed:
    - names:
      - libmysqlclient18
      - libmysqlclient-dev

xml-packages:
  pkg.installed:
    - names:
      - libxml2-dev
      - libxslt1-dev

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

project-virtualenv:
  virtualenv.manage:
    - name: {{ pillar['project']['virtualenv_path'] }}
    - no_site_packages: true
    - runas: {{ pillar['system']['user'] }}
    - require:
      - pkg: python-packages

project-virtualenv-postactivate:
  file.append:
    - name: {{ pillar['system']['home_path'] }}/.virtualenvs/postactivate
    - text:
      - "cd {{ pillar['project']['path'] }}"
    - require:
      - virtualenv: project-virtualenv

project-pip-requirements:
  pip.installed:
    - bin_env: {{ pillar['project']['virtualenv_path'] }}
    - requirements: {{ pillar['project']['path'] }}/requirements.txt
    - user: {{ pillar['system']['user'] }}
    - require:
      - pkg: common-packages
      - pkg: memcache-lib-packages
      - pkg: mysql-client-packages
      - pkg: pillow-packages
      - virtualenv: project-virtualenv
