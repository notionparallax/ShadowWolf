ShadowWolf 
==========
<img src="http://notionparallax.co.uk/img/Shadow_wolf_logo.png" align="right" >

A mini ERP type app to capture people, projects and their relationships.

It is being built in house at [BVN DH](https://bvn.com.au) as a way to pull together all our data sources. 

Currently it's main focus is on collecting data from disparate historical sources (all the spreadsheets that have been made in the past as problem hacks). Most of this data is incomplete and dirty, so the other thing that it does is allow people who have knowledge to go and edit the data themselves.

It is written for architecture practices, but might be applicable/portable to other fields.

The name comes from another [group of trackers](http://en.wikipedia.org/wiki/Shadow_Wolves).

## Demo ##
You can see a live version, with dummy data [here](http://notionparallax.co.uk/ShadowWolf/client/dist/index.html#/people) (This is pretty out of date, but will be updated soon as we've got a whole new deployment mechanism.)

## Contributing ##
We're probably not ready for anyone to get involved in a big way as we're changing too much stuff, but if there are any features that you would like to see, or bugs that you think we should fix, then feel free to open an issue.

### Development environment ###

ShadowWolf is 3 main components which currently live inside docker containers.
  1. A MongoDB database
  2. An Angular front end
  3. A rails back end

#### Installing ####
To install the environment for the first time:
```
mkdir Projects
cd Projects
git clone https://github.com/notionparallax/ShadowWolf.git
cd ShadowWolf
docker -d #this might not be necesary for you

./docker-util install
```
This will build the images.

####Starting a development session####
To save you from having to start these independently you can just run:

```
cd Projects/ShadowWolf/
./docker-util dev client
```
Which starts up the three containers in daemon mode. You can then go to [http://localhost:9000/#/people](http://localhost:9000/#/people) to see everything in action.

#####  Populating the DB with sample data #####
The DB is empty when you start it, so to fill it with sample data:
```
$ ./docker-util dev console
> FactoryGirl.create_list :person, 20
> FactoryGirl.create_list :project, 20
```

#### useful docker commands ####
 * `docker ps` - list all active docker containers
 * `docker kill` - kills a docker container
 * `./docker-util console` - opens a rails console connected to the Mongo database
 * `./docker-util run [bash]` - this takes a command and runs it inside the dev environment container. This lacks port forwarding and linking (e.g. no access to the DB). So it is useful for testing specific things in the environment.


 `./docker-util` is a very light wrapper around docker. If you want to do something that  `./docker-util` doesn't support then just read the [docker docs](http://docs.docker.io/en/latest/) and get on with it!

#### Stack ####

The Mongo back end uses the [MongoidModelMaker](https://github.com/Dawil/MongoidModelMaker) gem to build out the data models.

Rails really only works to control the database, flicking chunks of JSON at the angular client.


### Testing ###  

We had a bit of a spike at the beginning to get things going, but we are about ready to hook in Travis so that natty little icon will hopefully go green soon.

We are using PhantomJS and Selenium to do end to end tests to get started, and we'll introduce unit testing etc. once end to end is working nicely.

To run the tests

```
git push origin add-testing
```

<!--[![Build Status](https://travis-ci.org/notionparallax/ShadowWolf.png)](https://travis-ci.org/notionparallax/ShadowWolf)-->

