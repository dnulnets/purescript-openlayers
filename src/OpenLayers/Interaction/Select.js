//
// The Openlayers Interaction Select API mapping for purescript.
//
// This is just a very crude mapping and only helps out with what I need for this application. It is no
// complete mapping.
//
// Written by Tomas Stenlund, Sundsvall, Sweden (c) 2020
//
"use strict";

// Get hold of the OpenLayer types and functions
/*var ol  = require ('ol');
var oll = require ('ol/layer');
var olc = require ('ol/control')
var ols = require ('ol/source');
var olp = require ('ol/proj');
var olst = require ('ol/style');
var olg = require ('ol/geom');
var olgp = require ('ol/geom/Polygon');*/

var ol  = require ('ol');
var oli = require ('ol/interaction');

// Helper functions for purescripts FFI
//var p = require ('./src/OpenLayers/FFI.js');
//const { SelectEvent } = require('ol/interaction/Select');

function effgetfield (field) {
    return function (self) {
        return function () {
            return self[field];
        };
    };
}

//
// Select
//
exports.createImpl = function (opts) {
    return function() {
        if (opts) {
            if (opts.layers) {
                if (typeof opts.layers === 'function') {
                    opts.layers = function (l) {
                        return opts.layers(l)();
                    }
                }
            }
        }
        return new oli.Select (opts);
    }
}

exports.getFeaturesImpl = function (self) {
    return function() {
        return self.getFeatures();
    }
}

//
// SelectEvent
//
exports.getSelected=effgetfield("selected");
exports.getDeselected=effgetfield("deselected");
exports.getMapBrowserEvent=effgetfield("mapBrowserEvent")
