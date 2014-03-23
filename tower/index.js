#!/usr/bin/env node
'use strict';

var koa = require('koa');
var app = koa();
var router = require('tower-router');

router.get('api.index', '/api').action(function *(){
    this.type = 'text/html';
    this.body = '<h1>Hello World</h1>';
});

app.use(router());
app.listen(3000);
console.log('Listening on port %d', 3000);

// vim: set ft=javascript ai sw=4 sts=4 et:
