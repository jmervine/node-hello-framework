#!/usr/bin/env node
'use strict';

var connect = require('connect');
var Ni      = require('ni');
var port    = 3000;

// Set Ni root directory.
Ni.config('root', __dirname);


// Boot up Ni
Ni.boot(function() {

    // Initialize Connect as a router.
    var app = connect.createServer(
        Ni.router
    );

    // Simple logging.
    app.use(function(req, res, next) {
        next();
        console.log(req.method, req.url);
    });

    // Start Connect http listener.
    app.listen(port, function() {
        console.log('Listening on port %d', port);
    });
});

// vim: set ft=javascript ai sw=4 sts=4 et:
