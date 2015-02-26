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

### What we're doing ###
  1. Make a new branch called [issue number]-[Short_description_of_issue]   (underscore separated)
  1. Move issue into "in progress" on Waffle
  1. Work on issue
  1. Make pull request through GH website
  1. Move issue into "under review" column in Waffle
  1. Test/discuss/etc. code
  1. Merge pull request and delete branch
  1. Move issue into "in dev" column in Waffle
  1. Deploy if you feel like it

[![Throughput Graph](https://graphs.Waffle.io/notionparallax/shadowwolf/throughput.svg)](https://Waffle.io/notionparallax/shadowwolf/metrics)


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
docker -d #this might not be necessary for you

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

*Note:* docker-util is run from your local machine, it then does the work of `ssh`ing into the container for you. E.g.

    $ ~/Projects/ShadowWolf$ ./docker-util prod console

#### In Summary ####

docker-util can:

* build images for local use
* run local servers
* connect a console to local rails server (to create fake data)
* observe logs of local servers
* build images for production use
* deploy images to production

#### In detail ####

If the docker images do not exist on your machine:
(only needed once, takes the longest)

    ./docker-util install

To get the dev server running locally:
(only needed once per development session or on change to show files)

    ./docker-util dev client

To populate the local database with test users:
(only needed once per dev session)

    ./docker-util dev console
    # The following commands are in the ruby console
    p = FactoryGirl.create_list( :person, 10 ).first
    p.current_condition.name = 'Active' # make sure it's visible
    p.employee.login = 'bdoherty' # make sure it can log in via ActiveDirectory
    p.save

To re-run the build scripts after modifying any of the show pages:
(as mentioned above, only when show files change)

    ./docker-util dev client # same as above

yeah, apparently it works already. It may sometimes take a moment or two past when the docker-util script exists. So...

To look inside the local server and see when it finishes building:
(only when curious about ongoings of container)

    docker logs -f sw-client # the f is for follow

To build an image for deployment (asks for sudo password):
(only for predeployment)

    ./docker-util build client

To deploy an image (asks for BVN IP and server login):
(only for deployment)

    ./docker-util deploy client

So to do a full deployment you can:

    ./docker-util build client && ./docker-util build server && ./docker-util deploy client && ./docker-util deploy server

If you add the server IP to your `.bashrc` file then you can put a password in at the beginning and then leave it while you have a cup of tea!

You can always look inside the docker-util file to see how a command works under the hood. The script is just a handful of nested cases to match against arguments. Each matched command is usually a call to docker who's commands a documented with

    docker help
    docker [command] --help

Although if things work then you should theoretically be able to do without.

If you need to edit the production database you can use:

    ./docker-util dev console
    
and then use ruby commands. Some examples are shown in `ShadowWolf / Helper scripts / DB terminal scripts / photo.rb` 

#### Stack ####

The Mongo back end uses the [MongoidModelMaker](https://github.com/Dawil/MongoidModelMaker) gem to build out the data models.

Rails really only works to control the database, flicking chunks of JSON at the angular client.


### Testing ###

We had a bit of a spike at the beginning to get things going, but are starting to add end to end tests. We are using PhantomJS and Selenium to get started, and we'll introduce unit testing etc. once end to end is working nicely.

To run the tests

```
git push origin add-testing
```



<!--[![Build Status](https://travis-ci.org/notionparallax/ShadowWolf.png)](https://travis-ci.org/notionparallax/ShadowWolf)-->

