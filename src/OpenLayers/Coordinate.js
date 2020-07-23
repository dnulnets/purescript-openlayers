//
// The Openlayers Coordinate API mapping for purescript.
//
// Written by Tomas Stenlund, Sundsvall, Sweden (c) 2020
//
"use strict";

// Get hold of the OpenLayer types and functions
var ol  = require ('ol');
var olc = require ('ol/coordinate');

exports.toStringHDMSImpl = function (c, opt) {
        return olc.toStringHDMS(c, opt);
}
