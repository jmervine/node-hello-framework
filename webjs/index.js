#!/usr/bin/env node
'use strict';

var web = require('webjs');
var port = 3000;

// Initialize WebJS
web.run(port)

   // Simple logging.
   .use(function(req, res, next) {
        next();
        console.log(req.method, req.url);
   })

   // Simple router.
   .get({
        '/': function(req, res) {
            res.send('Hello WebJS!');
        }
    });

console.log('Listening on port %d', port);

// vim: set ft=javascript ai sw=4 sts=4 et:
