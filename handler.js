'use strict';

const exec = require('child_process').exec;

module.exports.hello_crystal = (event, context, callback) => {
  const child = exec('./buildfile/hello_crystal ' + "'" + JSON.stringify(event) + "'");

  child.stderr.on('data', (result) => {
    callback(result);
  });
  child.stdout.on('data', (result) => {
    callback(null,result);
  });
};

