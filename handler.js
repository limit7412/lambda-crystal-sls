'use strict';

const exec = require('child_process').exec;

module.exports.hello_ruby = (event, context, callback) => {
  const child = exec('./traveling-ruby/bin/ruby ./src/hello_ruby.rb ' + "'" + JSON.stringify(event) + "'");

  child.stdout.on('data', (result) => {
    callback(null,result);
  });
  child.stderr.on('data', (result) => {
    callback(result);
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
  const child = exec('./buildfile/build_elixir ' + "'" + JSON.stringify(event) + "'");

  child.stdout.on('data', (result) => {
    callback(null,result);
  });
  child.stderr.on('data', (result) => {
    callback(result);
  });
};
