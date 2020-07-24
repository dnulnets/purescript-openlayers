//
// The Openlayers Layer API mapping for purescript.
//
// This is just a very crude mapping and only helps out with what I need for this application. It is no
// complete mapping.
//
// Written by Tomas Stenlund, Sundsvall, Sweden (c) 2020
//
"use strict";

// Get hold of the OpenLayer types and functions
var oll  = require ('ol/layer');

exports.setSourceImpl = function (src, self) {
    return function() {
        self.setSource (src);
    }
}

exports.getSourceImpl = function (self) {
    return function() {
        return self.getSource (self);
    }
}
