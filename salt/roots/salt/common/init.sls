# Asia/Taipei:
#   timezone.system:
#     - utc: True

create-user:
  user.present:
    - name: {{ pillar['system']['user'] }}
    - home: {{ pillar['system']['home_path'] }}
    - shell: /bin/bash

en_US.UTF-8:
  locale.system

setup-locale:
  file.append:
    - name: {{ pillar['system']['home_path'] }}/.profile
    - text:
      - export LANG="en_US.UTF-8"
      - export LC_CTYPE="en_US.UTF-8"
      - export LC_NUMERIC="en_US.UTF-8"
      - export LC_TIME="en_US.UTF-8"
      - export LC_COLLATE="en_US.UTF-8"
      - export LC_MONETARY="en_US.UTF-8"
      - export LC_MESSAGES="en_US.UTF-8"
      - export LC_PAPER="en_US.UTF-8"
      - export LC_NAME="en_US.UTF-8"
      - export LC_ADDRESS="en_US.UTF-8"
      - export LC_TELEPHONE="en_US.UTF-8"
      - export LC_MEASUREMENT="en_US.UTF-8"
      - export LC_IDENTIFICATION="en_US.UTF-8"
    - require:
      - locale: en_US.UTF-8
      - user: create-user

common-packages:
  pkg.installed:
    - names:
      - htop
      - vim
      - git-core
      - subversion
      - sendmail
      - gettext

apt-update:
  cmd.run:
    - name: "apt-get -y update"
    - shell: /bin/bash
    - user: root
