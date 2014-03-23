#!/usr/bin/env node
'use strict';

var partial = require('partial.js');
var http = require('http');
var port = 3000;
var debug = true;

partial.run(http, debug, port, '127.0.0.1');

// vim: set ft=javascript ai sw=4 sts=4 et:
