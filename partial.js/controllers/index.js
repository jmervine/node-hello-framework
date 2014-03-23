exports.install = function(framework, name) {
    framework.route('/', function() {
        this.plain('Hello Partial.js');
    });
};
