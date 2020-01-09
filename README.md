# Docker Containers With PHP 5.6, Apache 2, Mysql 5.7, XHprof, Xdebug And Laravel
# Installation

## Set Up Virtual Environment
1. Install Docker
2. Set environment variables in `Makefile`.
    It will be different for Development And Production.
    This is an example for Development:
    ```
        #Environment
        
        ENV := dev
        
        DB_NAME := homestead
    ```
    You can also set up here another variables,
    like Docker Containers Names or Log Paths
2. Create Application:
   * `make install`
3. Add hosts on your Local Machine:
   * `make add-hosts`

*For Windows and MacOS steps 2, 3 may have some differences in php-extensions and files names.

# Maintenance

## Docker

### Run Docker Containers
* `make up`

### Rebuild and Run Docker Containers
* `make up-build`

### Stop Docker Containers
* `make down`

## Database management

### Load new sql-dump
1. Download new sql-dump as `DB_DUMP` variable path in `Makefile`
2. Clean DB and Load new sql-dump:
    * `make db-init db-dump`

### Running migrations
* `make db-migrate`

## Shell /bin/bash

### Connect to docker server container
* `make sh-server`

### Connect to docker db container
* `make sh-db`

## Logs

### View Docker server Container Log
* `make log-server`

### View Docker db Container Log
* `make log-db`

### View Application Log
* `make log-app`

### View PHP Log
* `make log-php`

### View MySQL All Queries Log
* `make log-mysql`

## Profiling with XHprof
XHprof PHP extension automatically installed on Development Version.

You can use it by open `/xhprof/` path in your Browser.

You can turn it On and Off and see Logs.

## Debugging with XDebug

#### Configure PHPStorm

**File > Settings > Languages & Framework > PHP > Debug :**

```
    Ignore external connections through unregistered server configurations: False
    
    Detect path mappings from deployment configurations: True
    
    Max. simultaneous connections: 3
    
    Xdebug port: 9000
    
    Can accept external connections: True
```

**File > Settings > Languages & Framework > PHP > Debug > DBGp Proxy :**
```
    IDE key: ide
    
    Host: host.docker.internal
    
    Port: 9000
```
**Settings > Languages & Framework > PHP > Servers**

```
    Host: 10.10.0.10 or company.dev.server
    
    Mappings:
    
    File/Directory: ~/project
    
    Absolute path on the server: /var/www
```

## Other

### Clean Application Files
* `make clean`

### Install Composer
* `make composer-install`

### Run Common Pre-Install Scripts
* `make pre-install`

### Run Environment Pre-Install Scripts
* `make pre-install-env`
