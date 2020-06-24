//
// The Openlayers Tile API mapping for purescript.
//
// This is just a very crude mapping and only helps out with what I need for this application. It is no
// complete mapping.
//
// Written by Tomas Stenlund, Sundsvall, Sweden (c) 2020
//
"use strict";

// Get hold of the OpenLayer types and functions
var olec  = require ('ol/events/condition');

/* The standard conditions */
exports.doubleClick = olec.doubleClick
exports.never = olec.never

/* Create a codition of your own */
exports.createImpl = function (f) {
    return function(event) {
        return f(event)();
    };
}
