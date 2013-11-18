# StreetVoice

## Deploy: Localhost

### Install

Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [vagrant](http://vagrantup.com/) first.

``` bash
# outside VM (Host OS)
$ vagrant plugin install vagrant-salt

# start
$ vagrant up

# login
$ vagrant ssh

# stop
$ vagrant halt
```


### Setup Database

``` bash
# inside VM (Guest OS)
$ mysqladmin -u root password YOURPASSWORD
$ mysql -u root -pYOURPASSWORD
mysql> create database streetvoice default charset utf8;
mysql> use streetvoice
mysql> source streetvoice.sql
```


### Run Django

```
# inside VM (Guest OS)
$ workon streetvoice
$ ./manage.py runserver 0.0.0.0:8000
```


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/StreetVoice/streetvoice-dev-bootstrap/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

