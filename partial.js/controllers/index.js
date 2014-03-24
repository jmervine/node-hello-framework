'use strict';

exports.install = function(framework, name) {
    framework.route('/', function() {
        this.plain('Hello Partial.js');
    });
};

// vim: set ft=javascript ai sw=4 sts=4 et:
