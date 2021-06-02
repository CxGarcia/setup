#!/usr/bin/env node
const fs = require('fs');
const path = require('path');

const args = process.argv.slice(2);
const cwd = process.cwd();

const BASE_PATH = fs.existsSync('./src')
  ? path.join(cwd, 'src', 'components')
  : fs.existsSync('./components')
  ? path.join(cwd, 'components')
  : '.';

for (const arg of args) {
  const [first, ...rest] = arg;
  const componentName = first.toUpperCase() + rest.join('');
  const dir = path.join(BASE_PATH, componentName);
  const file = path.join(dir, componentName);

  //skip dir creation if it already exists
  if (fs.existsSync(dir)) {
    console.log(
      `${componentName} already exists at: ${dir} - will skip its creation until the directory is deleted`
    );

    continue;
  }

  //create dir
  fs.mkdirSync(dir);

  //create js file
  fs.appendFile(
    `${file}.js`,
    `
import React from 'react';
import styles from './${componentName}.module.scss';

function ${componentName}({}) {
  return <div></div>;
}

export default ${componentName};
  `.trim(),
    function (err) {
      if (err) throw err;
    }
  );

  //scss module
  fs.appendFile(
    `${file}.module.scss`,
    "@import 'styles/main.scss';",
    function (err) {
      if (err) throw err;
    }
  );

  //barrel roll
  fs.appendFile(
    path.join(dir, 'index.js'),
    `
import ${componentName} from './${componentName}';

export default ${componentName};
  `.trim(),
    function (err) {
      if (err) throw err;
    }
  );

  console.log(`${componentName} has been created successfully at: ${dir}`);
}
