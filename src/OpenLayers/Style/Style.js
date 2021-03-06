//
// The Openlayers Style API mapping for purescript.
//
// This is just a very crude mapping and only helps out with what I need for this application. It is no
// complete mapping.
//
// Written by Tomas Stenlund, Sundsvall, Sweden (c) 2020
//
"use strict";

// Get hold of the OpenLayer types and functions
var olst  = require ('ol/style');

exports.createImpl = function (opt) {
    return function() {
        return new olst.Style(opt);        
    }
}

exports.setTextImpl = function (t, self) {
    return function() {
        self.setText (t);
    }
}
