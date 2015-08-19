# ShadowWolf Overview

1. [Prequisite Knowledge/Conceptual Dependencies](#Prequisite-Knowledge/Conceptual-Dependencies)
2. [Software Architecture](#Software-Architecture)
3. [Secrets](#Secrets)
4. [Tooling/Development and Deployment Workflow](#Tooling/Development-and-Deployment-Workflow)
5. [Technical Debt](#Technical-Debt)
6. [Missing Features/Further work](#Missing-Features/Further work)

## Prequisite-Knowledge/Conceptual-Dependencies

### Tech Stack

The tech stack includes:

* git
* bash, linux
* docker, vagrant
* ruby, rails, sinatra
* python, flask
* javascript, grunt, angular, polymer
* html, css

### Concepts

The concepts used include:

* containerization/microservices in docker-util and docker-compose
* data access objects (DAO) in OAF
* deployment and configuration is version controlled

In particular, if you don't understand containerisation I recommend you have a read up on it and a play with some docker containers. They are used extensively in our development and deployment process.

## Software-Architecture

### Containers

If you look inside `docker-compose.yml` you will see that there are 5 services needed to run the application:

* mongodb
* a rails server
* a Sinatra server (OAF)
* a flask server (Beowulf)
* an angular client

#### MongoDB

This is a pretty dumb container. It just runs an instance of mongo to be linked to the rails server and the occasional rails console.

#### Rails Server

Originally we only had Mongo, Rails and the Angular client. As such the Rails server handled a lot of different responsibilities. At the moment it handles:

* mediating between rails and the Angular client
* sending authentication requests to BVN's domain controllers (via LDAP-Omniauth)

#### OAF

Hides away OpenAsset's UI *issues*. For more info see [here](https://github.com/bvn-architecture/oaf).

#### Beowulf

Does the same thing but for Epicor. Is far simpler than OAF, however. All it does is provide two JSON routes for HTTP GET requests, one to convert a person login into a list of project numbers that they've worked on, the other to do the reverse, a project number to many logins. The Angular client performs joins with it's own data.

#### Angular

The angular client is rather meaty. It handles the presentation and editing of most of the data. A large part of it's functionality revolves around the Editables directive we implemented.

The Editables directive provides a way to display and edit fields and properties in a way that is very easy for a html writer to write. Unfortunately they've a bit of cruft and poor design in their implementation that makes further code additions rather distressing to the developer.

The bulk of the remainder of the Angular logic (and thus bugs) lies either in the controllers or the services.

The services typically interface with the previously mentioned services (Rails, Oaf, Beowulf). What makes them a pain is the lack of a Data Access Layer abstraction to unify the storage of data locally. Each service either handles caching in an ad-hoc fashion for only itself or they don't handle it at all, resulting in uncomfortable delays for the end user.

The controllers are ugly because they present a simple to use interface to html writers using a wide array of not always fully encapsulated components with various complexities and gotchas. The controllers being ugly is more a symptom than an original problem.

For more info on issues and technical see, see that part of the overview.

### Infrastructure

The docker containers are deployed to a single Ubuntu virtual machine running behind the firewall. This section will describe what's on that machine. For info on how to deploy to the machine, see that section of the overview. The Ubuntu virtual machine (hence forth 'server') has two user accounts, `ben` and `dave`. However since mostly only 'dave' used the server all of the things mentioned in this section are owned by that account.

On the server are the following:

* nightly backups (run-backup.sh)
* status monitoring and notifications (check-server-status.sh and handle-crash)
* logs (handled by docker-util during deployment)

The nightly backups are simply a cronjob to run mongodump and put it in a folder. Presumably at some point in the long distant future the server will run out of hard drive space. I'll leave that, and global warming, to the children of the future to solve.

Status monitoring is a cronjob that curls the server, hoping for 200 OK responses. If it get's anything else it uses mandrill to send a panic email.


## Secrets

Secrets that we have, but aren't in version control (because they're secret) are:

* server/config/local_env.yml - a configuration file telling rails about LDAP authentication, Open Asset and mandrill
* environment variables: OPEN_ASSET_USERNAME, OPEN_ASSET_PASSWORD and OPEN_ASSET_ENDPOINT
* ssh password to the deployment server

Because we're so ahead of the curve, here at BVN, we manage secrets by emailing them around.

## Tooling/Development-and-Deployment-Workflow

### Zero to Hero

```
git clone https://github.com/notionparallax/ShadowWolf
cd ShadowWolf
vagrant up
vagrant ssh
# See section on secrets
./docker-util build dev # Will fail on prodangular if first time, that's okay
docker-compose -p shadowwolf run --rm --no-deps devgrunt npm install
docker-compose -p shadowwolf run --rm --no-deps devgrunt bower --allow-root install
./docker-util dev client
```

### Deployment

Building and deploying are two separate processes. To build a service run

```
./docker-util build $service
```

Where service can be client, server, oaf or beowulf.

Once that's done you can run

```
./docker-util deploy $service
```

So if I made changes in both rails and angular, I would run

```
./docker-util build server \
  && ./docker-util build client \
  && ./docker-util deploy server \
  && ./docker-deploy client
```

I recommend you read docker-util to see what's involved in a deployment. Afterwards feel free to read the section on Technical debt again.

### Editing the database throught the console

For locally connecting to the database:

```
./docker-util dev console
```

For connecting to the production database:

```
./docker-util prod console
```

This will put you in a ruby/rails prompt.

You can get all People or Projects like so:

```ruby
ppl = Person.all.to_a
pjs = Project.all.to_a
```

Person and Project are mongoid models.

You can select from that a person with a particular login or project with project number:

```ruby
per = ppl.find_all { |p| p.employee.login == 'foo' }[0]
prj = pjs.find_all { |p| p.project_number == 'foo' }[0]
```

Any changes you make to these objects can be persisted by calling save:

```ruby
prj.project_number = 'bar'
prj.save
```

Additionally you can delete a model by calling destroy:

```ruby
prj.destroy
```

### Adding scripts to be accessed from the console

When you run `./docker-util prod console` this runs a container locally, but connected to the remote database. This means scripts you have locally in the `Helper scripts` folder can be accessed from within the container in the `/scripts` folder. For example:

```
$ cat <<RUBY > Helper\ scripts/baz.rb
def foo
  'bar'
end
RUBY
$ ./docker-util prod console
> require '/scripts/baz'
> foo
'bar'
```

### Local testing

```
./docker-util dev test oaf
./docker-util dev test beowulf
```

### Factories for Experimenting locally

```
./docker-util dev factories
```

### Dev workflow

Having installed the dev environment what I would normally do at the beginning of a day when I'm about to make some changes to the code base is:

```
./docker-util dev client && ./docker-util dev factories
# edit some files
# check the behavior in chrome
```

If some of the files I edited were html files in the /client folder then I would also have to run:

```
./docker-util dev grunt-includes
```

Occasionally I'll need to restart everything. Rerunning

```
./docker-util dev client && ./docker-util dev factories
```

Will bring me to a clean slate.


### Accessing a specific container

In case it wasn't already clear, docker-util is a very simple wrapper around some common utilities done with docker, docker-compose and ssh. If I wanted to access a container directly, outside of docker-util I would run:

```
docker-compose -p shadowwolf run --rm $container_name $command
```

I can optionally add in the `--no-deps` flag after `--rm` if the container dependencies are not needed. You can use all of the regular docker commands, like `docker ps` or `docker logs` to inspect the containers that are currently running.

### Redis RDB dumps

Since OAF cachings images in redis, but redis is included within the oaf container, when you deploy you are replacing the redis instance, along with all of it's saved image locations. Although the proper thing to do would be to put redis in a separate container so that OAF could be updated separate to redis (much like mongo and rails), for now the workaround is to copy the remote redis' data. Run

```
./docker-util get-redis-dump
```

to put a copy of remote's redis' data in the oaf folder. Then when

```
./docker-util build oaf
```

is run it will be included in the container, and the redis instance in the container will start with that dump.

A similar thing was going to be done for mongo dumps to make db restoration easier, but things came up and it didn't get finished.

### Restoring the DB from a backup

This is unfortunately a manualy process. It involves:

1. Stopping the mongo container on the server
2. Starting a new blank one
3. Starting a container linked to that with the mongo client installed and the backups in a shared volume
4. Running mongorestore
5. Restarting all the existing services

Look inside the ~/backups/mongoutil folder on the server to see how it's done.

## Technical-Debt

* Version dependencies everywhere are way behind. NB: bumping angular versions breaks editables, somehow
* docker util has a lot of code duplication. Moving things into bash functions would go a long way to improving code quality
* editables in-line their polymorphism for different types (numbers, text, date, etc) rather than being open and extensible. They also have a fair bit of complicated state and depend on functionality in the controller of whatever page they're usd on
* as mentioned in Infrastructure, data access in angular is not unified. This has lead to code duplication
* There is further code duplication in angular controllers
* Front end looks like a dogs dinner - no graphic designer time

OAF and Beowulf are both pretty good!

Mongo model maker was a thing, but it's dead now. Any reference to it in the code should be good to clean up.

## Missing-Features/Further work

See [waffle board](https://waffle.io/notionparallax/ShadowWolf) for all this sort of stuff. Suggestions of things to work on:

* removing code duplication from docker-util (easy)
* adding sourcemaps to the client so that debugging in production is easier. Could involve cleaning up the Gruntfile so that it's understood (easy)
* getting a better db restoration story, similar to the `get-redis-dump` feature (medium)
* refactoring editables to be open and extensible, with unit tests (hard)

## TroubleShooting/Common Errors

### container fails to start with "no such file" error

This is caused by Bill Gates. Windows has different newline settings, so if you ever edit a file in windows and save with windows newlines, then try and run that file in the linux virtual machine, things will break. Try to [identify which file is causing the error](http://superuser.com/questions/194668/grep-to-find-files-that-contain-m-windows-carriage-return) then save it as a unix file. In vim you would:

```
:set ff=unix
:wq
```

This can also occur when trying to run docker-util: "no such file /usr/bin/bash^M". The fix is the same.

### ./docker-util build client fails with permission denied or something about sass-cache

This can usually be fixed by running:

```
sudo chown -R vagrant:vagrant client
```

assuming you're in the vagrant machine. If you're on a machine with a different user and group then read the chown man page to see how to update the above command.

### Server failure 

If something really strange happens and the server is restarted then you can run:

```
docker ps
```
To see if things really are down
Then 
```
docker ps -a
```
to see the old containers
then (in this order)
```
docker start sw-mongo
docker start sw-server
docker start sw-oaf
docker start sw beowulf
docker start sw-client
```
and then everything should be fine.

If `docker ps -a` doesn't contain those all of those containers then you'll need to do a deploy.

A deploy won't start mongo. If you need to start it then:
```
docker run -d -p 27017:27017 -v /data/db:/data/db 10.22.14.67:5000/shadowwolf-mongo mongod --smallfiles
```
Hopefully you'll never need to run that though. Only if `docker ps -a` doesn't contain mongo.
