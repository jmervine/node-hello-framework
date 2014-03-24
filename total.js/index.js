#!/usr/bin/env node
'use strict';

var total = require('total.js');
var http = require('http');
var debug = true;

total.controller('hello', function() {
    return {
        install: function(framework) {
            framework.route('/', function() {
                this.plain('Hello Total.js!');
            });
        }
    };
});

total.run(http, debug, 3000);

// vim: set ft=javascript ai sw=4 sts=4 et:
