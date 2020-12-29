//
// The Openlayers Icon API mapping for purescript.
//
// This is just a very crude mapping and only helps out with what I need for the application
// that I currently have on hand. It is no complete mapping.
//
//
"use strict";

// Get hold of the OpenLayer types and functions
var ol  = require ('ol');
var olst  = require ('ol/style');

exports.createImpl = function (opt) {
    return function() {
        return new olst.Icon(opt);
    }
}