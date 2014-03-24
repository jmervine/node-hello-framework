#!/usr/bin/env node
'use strict';

var Hapi = require('hapi');
var port = 3000;
var server = Hapi.createServer('localhost', port);

server.route({
    method  : 'GET',
    path    : '/',
    handler : function(req, res) {
        res('Hello Hapi!');
    }
});

server.start(function() {
    console.log('Listening on port %d', port);
});

// vim: set ft=javascript ai sw=4 sts=4 et:
