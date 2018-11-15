'use strict';

const exec = require('child_process').exec;

module.exports.hello_ruby = (event, context, callback) => {
  exec('./traveling-ruby/bin/ruby ./src/hello_ruby.rb ' + "'" + JSON.stringify(event) + "'", (error, stdout, stderr) => {
    if (error) {
      callback(error);
    } else if (stderr) {
      callback(stderr);
    }

    callback(null,stdout);
  });
};

module.exports.hello_crystal = (event, context, callback) => {
  exec('./buildfile/hello_crystal ' + "'" + JSON.stringify(event) + "'", (error, stdout, stderr) => {
    if (error) {
      callback(error);
    }
    callback(stderr,stdout);
  });
};

module.exports.build_elixir = (event, context, callback) => {
  exec('./buildfile/build_elixir ' + "'" + JSON.stringify(event) + "'", (error, stdout, stderr) => {
    if (error) {
      callback(error);
    }
    callback(stderr,stdout);
  });
};
