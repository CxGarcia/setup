#!/usr/bin/env node
const fs = require('fs');
const path = require('path');

const args = process.argv.slice(2);
const BASE_PATH = fs.existsSync('./src') ? path.join(__dirname, 'src') : '.';

for (const arg of args) {
  const [first, ...rest] = arg;
  const componentName = first.toUpperCase() + rest.join('');
  const dir = path.join(BASE_PATH, componentName);
  const file = path.join(dir, componentName);

  if (!fs.existsSync(dir)) fs.mkdirSync(dir);

  //create js file
  fs.appendFile(
    `${file}.js`,
    `
import React from 'react';
import styles from '${componentName}.module.scss';

function ${componentName}({}) {
  return <div></div>;
}

export default ${componentName};
  `.trim(),
    function (err) {
      if (err) throw err;
      console.log('js created!');
    }
  );

  //scss module
  fs.appendFile(
    `${file}.module.scss`,
    "@import 'styles/main.scss';",
    function (err) {
      if (err) throw err;
      console.log('scss created!');
    }
  );

  //barrel roll
  fs.appendFile(
    path.join(dir, 'index.js'),
    `
import AlertStream from "./AlertStream";

export default AlertStream;
  `.trim(),
    function (err) {
      if (err) throw err;
      console.log('Saved!');
    }
  );
}
