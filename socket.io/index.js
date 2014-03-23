#!/usr/bin/env node
'use strict';

var fs = require('fs');

// initialize http server
var server = require('http').createServer(handler);

// initialize socket.io w/ server
var io = require('socket.io').listen(server);

// port listener
server.listen(3000);
console.log('Listening on port %d', 3000);

// handle http requests
function handler (req, res) {

    // load index.html
    fs.readFile(__dirname + '/index.html', function (err, data) {
        if (err) {
            res.writeHead(500);
            return res.end('Error loading index.html');
        }

        // send index.html content to client
        res.writeHead(200);
        res.end(data);
    });
}

io.sockets.on('connection', function (socket) {

    // send client hello message
    socket.emit('hello client', { hello: 'Hello Socket.IO Client!' });

    // listen for hello messages from client
    socket.on('hello server', function(data) {
        console.log(data.hello);
    });
});

// vim: set ft=javascript ai sw=4 sts=4 et:

