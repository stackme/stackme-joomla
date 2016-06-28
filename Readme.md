# stackme-joomla

##### A customisable Joomla docker-compose stack

## Features

* nginx (alpine)
* php-fpm 7 (alpine)
* MariaDB
* PostgresSQL

## Quickstart
### Fresh beginnings

First, make sure you have docker AND docker-compose installed on your host.
If you have downloaded the latest version of your hot new php based CMS, 
unzip that bad boy into the root of the html folder.

#### HTTP
```sh
docker-compose -f docker-compose.http.yml up
```

#### HTTPS
```sh
cd tls
./generate_self_signed_certificate.sh
# fill in the needed entries and wait for the magic to happen
cd ..
docker-compose -f docker-compose.https.yml up
```

At which point Docker should do it's thing, pulling, building and getting ready
for you to take over the interwebs. Yus.

But, you probably wanna make that thing more secure. So crack into the docker
compose files and change the ENVvars to something more suitable than 'secret'.
Customise away to your hearts content!

### Not so new beginnings

If you've already got a current CMS running, you will need to back up your 
static files and database.

Both MariaDB and PostgresSQL have a similar interface to import existing
databases. This involves adding either a *.sql or *.sh script to the 
'/docker-entrypoint-initdb.d' directory. See the respective docker-compose files
to see how to implement it. You may want to comment it out after the DB has been
imported.

## Todo

* Create script to download Joomla latest and put files in the right places
* HA/Service Discovery/Load Balancing
* Check if conform.sh is actually needed

## Contributions
Plz contribute! Issues, PRs, new CMS stacks, db/php performance tweaks - 
all the things!
