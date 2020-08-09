//
// The Openlayers Easing API mapping for purescript.
//
// This is just a very crude mapping and only helps out with what I need for this application. It is no
// complete mapping.
//
// Written by Tomas Stenlund, Sundsvall, Sweden (c) 2020
//
"use strict";

// Get hold of the OpenLayer types and functions
var ole  = require ('ol/easing');

/* The standard ease functions */
exports.easeIn = ole.easeIn
exports.easeOut = ole.easeOut
exports.inAndOut = ole.inAndOut
exports.linear = ole.linear
exports.upAndDown = ole.upAndDown
