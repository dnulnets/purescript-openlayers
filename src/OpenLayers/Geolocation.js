//
// The Openlayers Geolocation API mapping for purescript.
//
// Written by Tomas Stenlund, Sundsvall, Sweden (c) 2020
//
"use strict";

// Get hold of the OpenLayer types and functions
var ol  = require ('ol');

exports.createImpl = function (opt) {
    return function() {
        return new ol.Geolocation(opt);
    }
}

exports.getAccuracyGeometryImpl = function (self) {
    return function () {
        return self.getAccuracyGeometry();
    }
}

exports.getPositionImpl = function (self) {
    return function () {
        return self.getPosition();
    }
}

exports.getAltitudeImpl = function (self) {
    return function () {
        return self.getAltitude();
    }
}

exports.getAltitudeAccuracyImpl = function (self) {
    return function () {
        return self.getAltitudeAccuracy();
    }
}

exports.getAccuracyImpl = function (self) {
    return function () {
        return self.getAccuracy();
    }
}

exports.setTrackingImpl = function (onoff, self) {
    return function () {
        self.setTracking (onoff);
    }
}