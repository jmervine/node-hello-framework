# Node.js Hello Framework

### [https://github.com/jmervine/node-hello-framework](https://github.com/jmervine/node-hello-framework)

A far from complete collection of Hello World examples for various Node.js web frameworks.

> This was started using the following post as a spring board and I'm still in the progress of adding everything in there.
>
> [http://www.queness.com/post/16219/29-nodejs-frameworks-for-fast-javascript-development](http://www.queness.com/post/16219/29-nodejs-frameworks-for-fast-javascript-development)
>
> Please feel free to submit pull requests with additional framework examples following the template I've used:
>
> * runs on port 3000
> * make tasks
>   * `<framework>`
>   * `node_modules/<framework npm>`
>   * `clean/<framework>`

## Quick Start

    git clone https://github.com/jmervine/node-hello-framework.git
    cd node-hello-framework
    make <framework>

    # example:
    #
    # $ make express

#### Development

    # this take quite a while
    make test

    # this is better
    make test/<framework>_test.sh


## Frameworks:

* [node.js](#nodejs)
* [compound.js](#compoundjs)
* [connect](#connect)
* [express](#express)
* [flatiron](#flatiron)
* [geddy.js](#geddyjs)
* [hapi](#hapi)
* [locomotive.js](#locomotivejs)
* [ni](#ni)
* [nombo](#nombo)
* [partial.js](#partialjs)
* [restify](#restify)
* [sails.js](#sailsjs)
* [socketstream](#socketstream)
* [socket.io](#socketio)
* [spine](#spine)
* [stapes](#stapes)
* [totaljs](#totaljs)
* [webjs](#webjs)

----

## Framework Notes

Along with a short description, included are notes on extra steps -- aside from the `<framework>/index.js` example file, if any.

<a name="nodejs"></a>

----

### [Node.js][node.js]

This isn't a framework. This is a slightly expanded "Hello World" example where I created a simple http server which loads static files from a public directory if they exist and otherwise returns a message via the response. I wanted to be a pure node example, without any npm installed, as such I didn't include template rendering, but the addition of such wouldn't be difficult. I've included a commented out example of how to easily add [jade][jade] templating to this example.

<a name="compoundjs"></a>

----

### [Compound.js][compound.js]

Compound's formula is Express + structure + extensions. Where structure is the standard layout of directories, and extensions are node modules adding functionality to the framework. Compound's goal is to provide an obvious and well-organized interface for express compatible application development. This means that everything that works with express will work with compound.

#### Additional Notes

> To setup compound, as it's a generated framework, I did the following...

    npm install compound
    ./node_modules/.bin/compound init compound.js
    cd compound
    npm install
    npm install --save compound # because I installed compound locally

> I then...
>
> * Removed `public/index.html` to allow for the routing to work.
> * Added `app/controllers/hello_controller.js` to send the hello message.
> * Added `app/views/hello/index.ejs` to display the hello message.
> * Updated `config/routes.js` to point the main location to the hello controller.
>
> Once complete, I...

    node server.js

<a name="connect"></a>

----

### [Connect][connect]

Connect is a middleware framework for node, shipping with over 18 bundled middleware and a rich selection of 3rd-party middleware.

<a name="express"></a>

----

### [Express][express]

A [Sinatra] like router for node, which includes a [connect], as simple node middleware implementation.

<a name="flatiron"></a>

----

### [Flatiron][flatiron]

An adaptable framework for building modern web applications.

#### Additional Notes

> I addtion to the flatiron module, I also had to install the [union module] to get the example to work.

<a name="geddyjs"></a>

----

### [Geddy.js][geddy]

A simple, structured web framework for Node

#### Additional Notes

> To setup geddy, as it's a generated framework, I did the following...

    npm install geddy
    ./node_modules/.bin/geddy gen app geddy
    cd geddy

> Once complete, I...

    ../node_modules/.bin/geddy

<a name="hapi"></a>

----

### [Hapi][hapi]

A rich framework for building web applications and services. hapi is a simple to use configuration-centric framework with built-in support for input validation, caching, authentication, and other essential facilities. hapi enables developers to focus on writing reusable application logic instead of spending time building infrastructure. The framework supports a powerful plugin architecture for pain-free and scalable extensibility.

<a name="locomotivejs"></a>

----

### [Locomotive.js][locomotive]

Locomotive is a web framework for Node.js. Locomotive supports MVC patterns, RESTful routes, and convention over configuration, while integrating seamlessly with any database and template engine. Locomotive builds on [Express][express], preserving the power and simplicity you've come to expect from Node.

#### Additional Notes

> To setup geddy, as it's a generated framework, I did the following...

    npm install locomotive
    ./node_modules/.bin/lcm create locomotive
    cd locomotive
    npm install

> Once complete, I...

    ./node_modules/.bin/lcm server

<a name="ni"></a>

----

### [Ni][ni]

Ni a minimalistic Node framework that makes setting up an MVC project a breeze. Ni helps you set up a well-organized project, with a file structure separated into models, views, controllers, libraries and helpers. It's intuitive and simple to use, and doesn't get in the way of using other modules and Node plugins in your project.

#### Additional Notes

> Ni needs to be installed via [Github].

    npm install "git+https://github.com/chetan51/ni.git#master"


<a name="nombo"></a>

----

### [Nombo][nombo]

Nombo is a Node.js framework for building scalable realtime single-page apps.

#### Additional Notes

    npm install nombo
    ./node_modules/.bin/nombo create --force nombo
        # ^ WARNING: this will overwrite existing node_modules
    node nombo/server.node 3000

<a name="partialjs"></a>

----

### [PartialJS][partialjs]

Free web application framework for building Web sites and Web applications using JavaScript, HTML and CSS. From web developer for web developers.

<a name="restify"></a>

----

### [Restify][restify]

Restify is a node.js module built specifically to enable you to build correct REST web services. It intentionally borrows heavily from express as that is more or less the de facto API for writing web applications on top of node.js.

<a name="sailsjs"></a>

----

### [Sails.js][sailsjs]

Sails.js make it easy to build custom, enterprise-grade Node.js apps. It is designed to mimic the MVC pattern of frameworks like Ruby on Rails, but with support for the requirements of modern apps: data-driven APIs with scalable, service-oriented architecture. It's especially good for building chat, realtime dashboards, or multiplayer games.

#### Additional Notes

> To setup sail.js, as it's a generated framework, I did the following...

    npm install sails
    ./node_modules/.bin/compound init sails.js
    cd sails.js
    npm install
    ../node_modules/.bin/sails generate hello

> I then...
>
> * Added `views/hello/index.ejs` to display the hello message.
> * Updated `api/controllers/HelloController.js` to send the hello message.
> * Updated `config/routes.js` to point the main location to the hello controller.
> * Updated `config/local.js` to use port 3000 by default.
>
> Once complete, I...

    ../node_modules/.bin/sails lift

<a name="socketstream"></a>

----

### [SocketStream][socketstream]

A fast, modular Node.js web framework dedicated to building realtime single-page apps.

#### Additional Notes

    npm install socketstream
    ./node_modules/.bin/socketstream -m new socketstream
    cd socketstream
    npm install
    node app.js

<a name="socketio"></a>

----

### [SocketIO][socketio]

Socket.IO aims to make realtime apps possible in every browser and mobile device, blurring the differences between the different transport mechanisms. It's care-free realtime 100% in JavaScript.

<a name="spine"></a>

----

### [Spine][spine]

Spine is a lightweight framework for building JavaScript web applications. Spine gives you an MVC structure and then gets out of your way, allowing you to concentrate on the fun stuff, building awesome web applications.

#### Additional Notes

> As Spine is a client side framework, I simply downloaded and extracted [the spine zip file][spine zip]. I then removed all contents not used for this example.

<a name="totaljs"></a>

----

### [TotalJS][totaljs]

Free server framework for building Web sites and Web applications using JavaScript, HTML and CSS.

<a name="stapes"></a>

----

### [Stapes][stapes]

Stapes.js is designed to be agnostic about your setup and style of coding. Like to code using models, views and controllers? Or just with modules? Use jQuery? Zepto? React? Rivets? Whatever you fancy, Stapes gives you the necessary building blocks to build a kick-ass app. Class creation, custom events, and data methods. That's all it does. Even a lightweight framework like Backbone has more than 75 methods, Stapes has just 20. Because of its size (just 2kb minified and gzipped) Stapes is ideal to use in a mobile site. At just around 600 lines of codes, it's easy to debug and see how it works under the hood.

#### Additional Notes

> As Stapes is a client side framework, I simply downloaded [stapes.min.js] from [Github].

<a name="totaljs"></a>

----

### [TotalJS][totaljs]

Free server framework for building Web sites and Web applications using JavaScript, HTML and CSS.

<a name="webjs"></a>

----

### [WebJS][webjs]

WebJS makes your websites' and web apps' server-side script simplier, faster, more stable and more readable.

----

## In Flux

This is a list of frameworks, which either have been implemented or partly implement, but aren't considered active or working to do some special circumstance.

----

### [Koa][koa]

Koa is a new web framework designed by the team behind Express, which aims to be a smaller, more expressive, and more robust foundation for web applications and APIs. Through leveraging generators Koa allows you to ditch callbacks and greatly increase error-handling. Koa does not bundle any middleware within core, and provides an elegant suite of methods that make writing servers fast and enjoyable.

> Sample code exists but is disabled as it's un-tested at this time due to it's node >=0.11 requirement.

----

### [Tower][tower]

Small components for building apps, manipulating data, and automating a distributed infrastructure.

> Sample code exists but is disabled as it's un-tested at this time due to it's node >=0.11 requirement.

----

## Omitted

Here's a list of frameworks that were omitted for various reason.

----

### [Bone.io][boneio]

Bone.io is a lightweight framework for building high performance Realtime Single Page HTML5 Apps.

> Bone.io has been omitted at this time, as I found it's documentation to be so unclear, that I after about an hour, I gave up on getting a simple example working.

----

### [Coke][coke]

"COKE is a lightweight node.js MVC framework that speeds up your web development. It's simple, it's modularized, it's somking fast!"

> Coke has been omitted at this time, as a pure npm install is either unsupported, it requires [MongoDB].

----

### [Kiss.js][kissjs]

Object-oriented web framework on Node.js, written in CoffeeScript.

> Kiss.js has been omitted at this time, as it doesn't work without [coffescript], which I don't consider real node, and therefore am not supporting here in this repo.

----

### [Derby][derby]

MVC framework making it easy to write realtime, collaborative applications that run in both Node.js and browsers.

> Derby has been omitted at this time, as a pure npm install is either unsupported, it requires [MongoDB].

----

### [Meteor][meteor]

Meteor is an open-source platform for building top-quality web apps in a fraction of the time, whether you're an expert developer or just getting started.

> Meteor has been omitted at this time, as a pure npm install is either unsupported or broken.

----

### [Opa][opa]

Opa is a full-stack open source web development framework for JavaScript that lets you write secure and scalable web applications.

> Opa has been omitted at this time, as a pure npm install is either unsupported or broken.

----

[node.js]: http://nodejs.org/api/http.html
[compound.js]: http://compoundjs.com/
[connect]: http://www.senchalabs.org/connect/
[express]: http://expressjs.com/
[flatiron]: http://flatironjs.org/
[geddy]: http://geddyjs.org/
[hapi]: http://spumko.github.io/
[locomotive]: http://locomotivejs.org/
[ni]: https://github.com/chetan51/ni
[nombo]: http://nombo.io/
[partialjs]: http://www.partialjs.com/
[partial.js]: http://www.partialjs.com/
[restify]: http://mcavage.me/node-restify/
[sailsjs]: http://sailsjs.org/
[socketstream]: http://www.socketstream.org/
[socketio]: http://socket.io/
[spine]: http://spinejs.com/
[stapes]: http://hay.github.io/stapes/
[totaljs]: http://www.totaljs.com/
[webjs]: http://iwillwen.github.io/webjs/

[koa]: http://koajs.com/
[tower]: http://tower.github.io/

[boneio]: http://bone.io/
[coke]: http://coke-js.org/
[derby]: http://derbyjs.com/
[kissjs]: http://stanislavfeldman.github.io/kiss.js/
[meteor]: https://www.meteor.com/
[opa]: http://opalang.org/

[jade]: http://jade-lang.com/
[union module]: https://www.npmjs.org/package/union
[Redis]: http://redis.io/
[MongoDB]: https://www.mongodb.org/
[Sinatra]: http://www.sinatrarb.com/
[spine zip]: http://spinejs.com/pages/download
[coffeescript]: http://coffeescript.org/
[stapes.min.js]: https://raw.githubusercontent.com/hay/stapes/master/stapes.min.js
[Github]: https://github.com/

