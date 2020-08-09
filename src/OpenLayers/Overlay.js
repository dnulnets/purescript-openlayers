//
// The Openlayers Overlay API mapping for purescript.
//
// Written by Tomas Stenlund, Sundsvall, Sweden (c) 2020
//
"use strict";

// Get hold of the OpenLayer types and functions
var ol  = require ('ol');

exports.setPositionImpl = function (pos, self) {
  return function() {
    return self.setPosition (pos);
  }
}

exports.createImpl = function (opt) {
    return function() {
        return new ol.Overlay(opt);
    }
}
