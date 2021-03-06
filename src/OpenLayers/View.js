//
// The Openlayers View API mapping for purescript.
//
// Written by Tomas Stenlund, Sundsvall, Sweden (c) 2020
//
"use strict";

// Get hold of the OpenLayer types and functions
var ol  = require ('ol');

function effize (method) {
    return function () {
        var me = arguments[arguments.length - 1];
        var args = Array.prototype.slice.call(arguments, 0, -1);
        return function () {
            return me[method].apply(me, args);
        };
    };
}

// new operator for a View
exports.createImpl = function (opt) {
    return function() {
        var r = new ol.View(opt);
        return r;
    }
}

// Setters
exports.setCenterImpl = effize("setCenter");
exports.setZoomImpl = effize("setZoom");

// Getters
exports.getProjectionImpl = effize("getProjection");
exports.getResolutionImpl = effize("getResolution");
exports.getCenterImpl = effize("getCenter");
exports.getZoomImpl = effize("getZoom");
