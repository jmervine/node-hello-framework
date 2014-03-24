#!/usr/bin/env node
'use strict';

//var http = require('http');
var connect = require('connect');

var port = 3000;
var app = connect();

app.use(function(req, res){
    res.end('Hello Connect!\n');
});

app.listen(port, function() {
    console.log('Listening on port %d', port);
});

// vim: set ft=javascript ai sw=4 sts=4 et:
