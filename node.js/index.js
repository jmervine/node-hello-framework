#!/usr/bin/env node
'use strict';

/*****************************************************************
 * At the core most, if not all nodejs frameworks are extensions
 * of node's core http module, coupled with a few other core
 * modules (e.g. fs, util, etc.), put together ease implementation
 * and mask the internals. However, for most simple use cases,
 * a core http implementation will actually suffice. That said,
 * those of us who come from other languages, our knee jerk reaction
 * is to gravitate towards frameworks.
 *
 * Here I cover "Hello Node!" in three different methods:
 *
 * 1. Simply returning the message via http response to the request.
 *
 * 2. Loading static html file on request, and returning it via
 *    the http response.
 *****************************************************************/

var fs = require('fs');
var path = require('path');

// configuration
var Config = {
    public: path.resolve(__dirname, 'public'),

    // Here I've build a simple list of mime types
    // keyed by their extensions.
    types:  {
        default : 'text/html',
        html    : 'text/html',
        js      : 'application/javascript',
        css     : 'text/css',
        gif     : 'image/gif',
        png     : 'image/png',
        ico     : 'image/x-icon',
        json    : 'application/json'
    }

    // I've chose not to use npm's in this example, but were I to,
    // I would install mime - npm install mime - and replace the
    // types object above with something like this:
    //
    // types: function(type) {
    //     return require('mime').lookup(type)
    // }
    //
    // usage:
    //
    // res.setHeader('Content-Type', Config.types(try_path)); /* see below for try_path */
};

// initialize http server
var server = require('http').createServer(handler);

// port listener
server.listen(3000);
console.log('Listening on port %d', 3000);

// handle http requests
function handler (req, res) {

    // static file handler
    function requestHandler(err, data) {
        if (err) {
            // An error will be thrown if the file doesn't exist.
            //
            // This is where dynamic handling begins. You can write
            // out a message like I'm doing below, or include a template
            // rendering engine and render your templates based on the
            // request path - req.url - and/or the request method -
            // req.path.
            console.log('Sending:', req.url);
            res.setHeader('Content-Type', Config.types.default);
            res.writeHead(200);
            return res.end('Hello Node!<br /><br />Say hi to <a href=/hello.html>Hello Static</a> as well!');

            /**************************************************************
             * Here's a working example of using a templating engine, like
             * jade and returning an error, if no template is found.
             *
             * To use this example:
             *
             * 1. Comment out the lines above.
             *
             * 2. Install jade - npm install jade
             *
             * 3. Create a template in views/index.jade the following
             *    contents:
             *
             *    html
             *        body
             *            != message
             *
             **************************************************************/

            // Config.views  = path.resolve(__dirname, 'views');
            //
            // var view_path = path.resolve(Config.views, req.url);
            //
            // if (!view_path.match(/\.jade$/)) view_path = view_path + '/index.jade';
            //
            // require('jade')renderFile(view_path, {}, function(err, html) {
            //     if (err) {
            //         res.writeHead(404);
            //         return res.end();
            //     }
            //     console.log('Sending:', req.url);
            //     res.setHeader('Content-Type', Config.types.html);
            //     res.writeHead(200);
            //     return res.end(html);
            // });
        }

        // If there's no error, then the static file exists. We'll need
        // to pass a mime type and load the file before sending it in the
        // response.
        var content_type = Config.types.default;
        Object.keys(Config.types).forEach(function(type) {
            if (req.url.match(new RegExp(type+'$'))) {
                content_type = Config.types[type];
            }
        });

        console.log('Sending: %s [static]', req.url);
        res.setHeader('Content-Type', content_type);
        res.writeHead(200);
        return res.end(data);
    }

    // Contruct a path to check.
    var try_path = path.resolve(Config.public, req.url.replace(new RegExp('^/'), ''));

    // Without an extension, add index.html.
    if (!try_path.match(/\.[a-zA-Z0-9]+$/)) try_path = try_path + '/index.html';

    // Check for a static file.
    fs.readFile(try_path, requestHandler);
}

// vim: set ft=javascript ai sw=4 sts=4 et:
