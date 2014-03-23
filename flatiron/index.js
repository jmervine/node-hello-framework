#!/usr/bin/env node
'use strict';

var flatiron = require('flatiron');
var app = flatiron.app;

app.use(flatiron.plugins.http, {});

app.router.get('/', function () {
    this.res.writeHead(200, { 'Content-Type': 'text/plain' })
    this.res.end('Hello Flatiron!');
});

app.start(3000);
console.log('Listening on port %d', 3000);

// vim: set ft=javascript ai sw=4 sts=4 et:
