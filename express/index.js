#!/usr/bin/env node
'use strict';

var express = require('express');
var app = express();

app.get('/', function(req, res){
  res.send('Hello Express!');
});

var server = app.listen(3000, function() {
    console.log('Listening on port %d', server.address().port);
});

// vim: set ft=javascript ai sw=4 sts=4 et:
