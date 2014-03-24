#!/usr/bin/env node
'use strict';

function HomeController() {
    this.index = function(req, res, next) {
        res.end('Hello Ni!');
    }
}

module.exports = new HomeController();
// vim: set ft=javascript ai sw=4 sts=4 et:
