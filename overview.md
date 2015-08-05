# ShadowWolf Overview

1. [Prequisite Knowledge/Conceptual Dependencies](#Prequisite-Knowledge/Conceptual-Dependencies)
2. [Software Architecture](#Software-Architecture)
3. [History and Context](#History-and-Context )
4. [Secrets](#Secrets)
5. [Tooling/Development and Deployment Workflow](#Tooling/Development-and-Deployment-Workflow)
6. [Technical Debt](#Technical-Debt)
7. [Missing Features/Further work](#Missing-Features/Further work)

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

## Software-Architecture

### Containers

If you look inside `docker-compose.yml` you will see that there are 5 services needed to run the application:

* mongodb
* a rails server
* a sinatra server (OAF)
* a flask server (Beowulf)
* an angluar client

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

#### Database Restorations

Not listed (because we don't have it) is a nice way to perform database restorations. It can be done, since the backups are there, but it's only been done less than a handful of times. The manual process involves:

1. Stopping the mongo container on the server
2. Starting a new blank one
3. Starting a container linked to that with the mongo client installed and the backups in a shared volume
4. Running mongorestore
5. Restarting all the existing services

## History-and-Context 
## Secrets

Secrets that we have, but aren't in version control (because they're secret) are:

* server/config/local_env.yml - a configuration file telling rails about LDAP authentication, Open Asset and mandrill
* environment variables: OPEN_ASSET_USERNAME, OPEN_ASSET_PASSWORD and OPEN_ASSET_ENDPOINT
* ssh password to the deployment server

Because we're so ahead of the curve, here at BVN, we manage secrets by emailing them around.

## Tooling/Development-and-Deployment-Workflow
## Technical-Debt
## Missing-Features/Further work
