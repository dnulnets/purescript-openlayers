//
// The Openlayers Overlay API mapping for purescript.
//
// This is just a very crude mapping and only helps out with what I need for this application. It is no
// complete mapping.
//
// Written by Tomas Stenlund, Sundsvall, Sweden (c) 2020
//
"use strict";

// Get hold of the OpenLayer types and functions
var ol  = require ('ol');
var ols  = require ('ol/source');

exports.createImpl = function (opt) {
    return function() {
        var r = new ols.OSM(opt);
        return r;
    }
}
