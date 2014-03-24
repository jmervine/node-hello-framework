#!/usr/bin/env node
'use strict';

var fs = require('fs');

// initialize http server
var server = require('http').createServer(handler);

// port listener
server.listen(3000);
console.log('Listening on port %d', 3000);

// handle http requests
function handler (req, res) {

    function urlHandler(err, data) {
        if (err) {
            res.writeHead(500);
            return res.end('Error loading '+ req.url);
        }

        console.log('Sending:', req.url);

        // send file data as response
        if (req.url.match(/\.html$/)) {
            res.setHeader('Content-Type', 'text/html');
        }

        if (req.url.match(/\.js$/)) {
            res.setHeader('Content-Type', 'application/javascript');
        }

        res.writeHead(200);
        res.end(data);
    }

    if (req.url === '/') {
        fs.readFile(__dirname + '/hello.html', urlHandler);
    } else {
        fs.readFile(__dirname + req.url, urlHandler);
    }

}

// vim: set ft=javascript ai sw=4 sts=4 et:
