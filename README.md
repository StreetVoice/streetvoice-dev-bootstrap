## DESCRIPTION

StreetVoice Development Environment on top of a Vagrant VM.



## REQUIREMENTS

* [VirtualBox](http://www.virtualbox.org/)
* [Vagrant](http://www.vagrantup.com/)


## BASIC USAGE

    $ git clone https://github.com/tzangms/streetvoice-dev-bootstrap.git
    $ cd streetvoice-dev-bootstrap
    $ vagrant box add base http://files.vagrantup.com/precise64.box
    $ vagrant up
    $ vagrant ssh