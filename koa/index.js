#!/usr/bin/env node
'use strict';

var koa = require('koa');
var app = koa();

app.use(function *(){
  this.body = 'Hello World';
});

app.listen(3000);
console.log('Listening on port %d', 3000);

// vim: set ft=javascript ai sw=4 sts=4 et:
