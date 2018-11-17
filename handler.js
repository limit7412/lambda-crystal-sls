'use strict';

const exec = require('child_process').exec;

module.exports.hello_crystal = (event, context, callback) => {
  const child = exec(`echo '${JSON.stringify(event)}' | ./buildfile/main`);

  child.stderr.on('data', (result) => {
    callback(JSON.parse(result));
  });
  child.stdout.on('data', (result) => {
    const stdout = result
      .replace(/\"{/g,'{')
      .replace(/}\"/g,'}')
      .replace(/\\\"/g,'"')
      .split('\n')[0];
    callback(null,JSON.parse(stdout));
  });
};

