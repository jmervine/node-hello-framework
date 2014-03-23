# Node.js Hello <framework>

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

### Frameworks:

* [express]
* [geddy]
* [flatiron]
* [locomotive]
* [nombo]
* [partial.js]
* [socketstream]
* [socket.io]
* ~~[koa]~~
* ~~[tower]~~

## Quick Start

    git clone <repo>
    cd <repo>
    make <framework>

    # example:
    #
    # $ make express

## Framework Setup Notes

Here's list of notes on extra steps -- aside from the `<framework>.js` example file, if any.

### Geddy

    npm install geddy
    ./node_modules/.bin/geddy gen app geddy
    cd geddy
    ../node_modules/.bin/geddy

### Flatiron

I addtion to the flatiron module, I also had to install the [union module] to get the example to work.

### Locomotive

    npm install locomotive
    ./node_modules/.bin/lcm create locomotive
    cd locomotive
    npm install
    ./node_modules/.bin/lcm server

### Nombo

    npm install nombo
    ./node_modules/.bin/nombo create --force nombo
        # ^ WARNING: this will overwrite existing node_modules
    node nombo/server.node 3000

### SocketStream

    npm install socketstream
    ./node_modules/.bin/socketstream -m new socketstream
    cd socketstream
    npm install
    node app.js

----

## In Flux

### Koa

Sample code exists but is disabled as it's un-tested at this time due to it's node >=0.11 requirement.

### Tower

Sample code exists but is disabled as it's un-tested at this time due to it's node >=0.11 requirement.

----

## Omitted

Here's a list of frameworks that were omitted for various reason. This could also be considered an extension of the TODO list.

### Meteor

Meteor has been omitted at this time, as a pure npm install is either unsupported or broken.

### Derby

Derby has been omitted at this time, as a pure npm install is either unsupported, as it requires [Redis] and/or [MongoDB].

### Opa

Ops has been omitted at this time, as a pure npm install is either unsupported or broken.

Does not work without Mongo and Redis.


[express]: http://expressjs.com/
[geddy]: http://geddyjs.org/
[flatiron]: http://flatironjs.org/
[locomotive]: http://locomotivejs.org/
[nombo]: http://nombo.io/
[partial.js]: http://www.partialjs.com/
[socketstream]: http://www.socketstream.org/
[socket.io]: http://socket.io/
[koa]: http://koajs.com/
[tower]: http://tower.github.io/

[union module]: https://www.npmjs.org/package/union
[Redis]: http://redis.io/
[MongoDB]: https://www.mongodb.org/

