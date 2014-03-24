# Node.js Hello Framework

### [https://github.com/jmervine/node-hello-framework](https://github.com/jmervine/node-hello-framework)

A far from complete collection of Hello World examples for various Node.js web frameworks.

> This was started using the following post as a spring board and I'm still in the progress of adding everything in there.
>
> http://www.queness.com/post/16219/29-nodejs-frameworks-for-fast-javascript-development
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

## Frameworks:

* [connect]
* [express]
* [geddy]
* [flatiron]
* [locomotive]
* [nombo]
* [partial.js]
* [socketstream]
* [socket.io]
* [spine]
* [hapi]

## Framework Notes

Along with a short description, included are notes on extra steps -- aside from the `<framework>/index.js` example file, if any.

### [Connect][connect]

Connect is a middleware framework for node, shipping with over 18 bundled middleware and a rich selection of 3rd-party middleware.

### [Express][express]

A [Sinatra] like router for node, which includes a [connect], as simple node middleware implementation.

### [Geddy][geddy]

A simple, structured web framework for Node

#### Additional Notes

    npm install geddy
    ./node_modules/.bin/geddy gen app geddy
    cd geddy
    ../node_modules/.bin/geddy

### [Flatiron][flatiron]

An adaptable framework for building modern web applications.

#### Additional Notes

> I addtion to the flatiron module, I also had to install the [union module] to get the example to work.

### [Locomotive][locomotive]

Locomotive is a web framework for Node.js. Locomotive supports MVC patterns, RESTful routes, and convention over configuration, while integrating seamlessly with any database and template engine. Locomotive builds on [Express][express], preserving the power and simplicity you've come to expect from Node.

#### Additional Notes

    npm install locomotive
    ./node_modules/.bin/lcm create locomotive
    cd locomotive
    npm install
    ./node_modules/.bin/lcm server

### [Nombo][nombo]

Nombo is a Node.js framework for building scalable realtime single-page apps.

#### Additional Notes

    npm install nombo
    ./node_modules/.bin/nombo create --force nombo
        # ^ WARNING: this will overwrite existing node_modules
    node nombo/server.node 3000

### [SocketStream][socketstream]

A fast, modular Node.js web framework dedicated to building realtime single-page apps.

#### Additional Notes

    npm install socketstream
    ./node_modules/.bin/socketstream -m new socketstream
    cd socketstream
    npm install
    node app.js

### [Spine][spine]

Spine is a lightweight framework for building JavaScript web applications. Spine gives you an MVC structure and then gets out of your way, allowing you to concentrate on the fun stuff, building awesome web applications.

#### Additional Notes

> As Spine is a client side framework, I simply downloaded and extracted [the spine zip file][spine zip]. I then removed all contents not used for this example.

### [Hapi][hapi]

A rich framework for building web applications and services. hapi is a simple to use configuration-centric framework with built-in support for input validation, caching, authentication, and other essential facilities. hapi enables developers to focus on writing reusable application logic instead of spending time building infrastructure. The framework supports a powerful plugin architecture for pain-free and scalable extensibility.

----

## In Flux

### [Koa][koa]

Koa is a new web framework designed by the team behind Express, which aims to be a smaller, more expressive, and more robust foundation for web applications and APIs. Through leveraging generators Koa allows you to ditch callbacks and greatly increase error-handling. Koa does not bundle any middleware within core, and provides an elegant suite of methods that make writing servers fast and enjoyable.

**Sample code exists but is disabled as it's un-tested at this time due to it's node >=0.11 requirement.**

### [Tower][tower]

Small components for building apps, manipulating data, and automating a distributed infrastructure.

**Sample code exists but is disabled as it's un-tested at this time due to it's node >=0.11 requirement.**

----

## Omitted

Here's a list of frameworks that were omitted for various reason. This could also be considered an extension of the TODO list.

### [Meteor][meteor]

Meteor is an open-source platform for building top-quality web apps in a fraction of the time, whether you're an expert developer or just getting started.

**Meteor has been omitted at this time, as a pure npm install is either unsupported or broken.**

### [Derby][derby]

MVC framework making it easy to write realtime, collaborative applications that run in both Node.js and browsers.

**Derby has been omitted at this time, as a pure npm install is either unsupported, as it requires [Redis] and/or [MongoDB].**

### [Opa][opa]

Opa is a full-stack open source web development framework for JavaScript that lets you write secure and scalable web applications.

**Opa has been omitted at this time, as a pure npm install is either unsupported or broken.**


[connect]: http://www.senchalabs.org/connect/
[express]: http://expressjs.com/
[geddy]: http://geddyjs.org/
[flatiron]: http://flatironjs.org/
[locomotive]: http://locomotivejs.org/
[nombo]: http://nombo.io/
[partial.js]: http://www.partialjs.com/
[socketstream]: http://www.socketstream.org/
[socket.io]: http://socket.io/
[spine]: http://spinejs.com/
[hapi]: http://spumko.github.io/

[koa]: http://koajs.com/
[tower]: http://tower.github.io/
[meteor]: https://www.meteor.com/
[derby]: http://derbyjs.com/
[opa]: http://opalang.org/

[union module]: https://www.npmjs.org/package/union
[Redis]: http://redis.io/
[MongoDB]: https://www.mongodb.org/
[Sinatra]: http://www.sinatrarb.com/
[spine zip]: http://spinejs.com/pages/download
