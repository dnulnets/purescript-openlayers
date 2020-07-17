//
// The Openlayers Object API mapping for purescript.
//
// Written by Tomas Stenlund, Sundsvall, Sweden (c) 2020
//
"use strict";

// Get hold of the OpenLayer types and functions
var ol  = require ('ol');

exports.getImpl = function (name, self) {
    return self.get(name); 
}

exports.setImpl = function (name, v, b, self) {
    return self.set(name, v, b);
}
