#!/usr/bin/env node
'use strict';

var restify = require('restify');
var app = restify.createServer();
var port = 3000;

app.get('/', function(req, res, next) {
    res.send('Hello Restify!');
});

app.listen(port, function() {
    console.log('Listening on port %d', port);
});

// vim: set ft=javascript ai sw=4 sts=4 et:
