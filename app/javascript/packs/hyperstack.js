// Import all the modules
import React from 'react';
import ReactDOM from 'react-dom';
import { BarLoader } from 'react-spinners';

// for opal/hyperstack modules to find React and others they must explicitly be saved
// to the global space, otherwise webpack will encapsulate them locally here
global.React = React;
global.ReactDOM = ReactDOM;
global.BarLoader = BarLoader;

console.log('The Global in th hyperstack.js');
console.log(global);
console.log(global.React);
console.log(global.ReactDOM);
console.log(global.BarLoader);
