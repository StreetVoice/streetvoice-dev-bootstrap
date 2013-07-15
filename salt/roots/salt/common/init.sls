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
